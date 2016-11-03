# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit multilib-build eutils python-r1 distutils-r1 git-2

DESCRIPTION="Open source software library for numerical computation using data flow graphs."
HOMEPAGE="http://www.tensorflow.org/"
SRC_URI="https://github.com/tensorflow/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SRC_URI=""
EGIT_REPO_URI="https://github.com/tensorflow/tensorflow.git"
EGIT_HAS_SUBMODULES="yes"
if [[ ${PV} != 9999 ]]; then
	EGIT_COMMIT="v${PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cray cuda system-protobuf"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	 dev-python/six[${PYTHON_USEDEP}]
"
DEPEND=">=dev-util/bazel-0.1.0
	dev-lang/swig
	${RDEPEND}"

python_prepare() {
	#epatch "${FILESDIR}"/0.8.0-adjust-configure.patch

	if use cray; then
		sed -i "s:/bin/bash:/usr/bin/env bash:" third_party/gpus/cuda/cuda_config.sh || die "Failed to patch third_party/gpus/cuda/cuda_config.sh"
		sed -i -e "s:/usr/bin/gcc:${GCC_PATH}/snos/bin/gcc:" -e "s:/usr/bin/env python2.7:${EPREFIX}/usr/bin/python2.7:" third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc || die "Failed to patch third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc"
	fi
	sed -i "s:NVCC_PATH = .*:NVCC_PATH = '$(which nvcc)':" third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc || die "Failed to patch third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc"
	sed -i "s:PREFIX_DIR = .*:PREFIX_DIR = '${EPREFIX}':" third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc || die "Failed to patch third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc"
	for flag in $LDFLAGS; do
		sed -i "114 i   linker_flag: \"${flag}\"" third_party/gpus/crosstool/CROSSTOOL || die "Failed to patch third_party/gpus/crosstool/CROSSTOOL"
	done

	python_includes=( "$(${EPYTHON} -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")" "$(${EPYTHON} -c "import numpy; print(numpy.get_include())")" )
	echo "python_includes: $EPYTHON ${python_includes[@]}"
	for dir in ${python_includes[@]}; do
		sed -i "106 i   compiler_flag: \"-I${dir}\"" third_party/gpus/crosstool/CROSSTOOL || die "Failed to patch third_party/gpus/crosstool/CROSSTOOL"
	done
	source_includes=(
		"${GCC_PATH}/snos/include/"
		"${GCC_PATH}/snos/include/g++/"
		"${GCC_PATH}/snos/lib/gcc/x86_64-suse-linux/${GCC_VERSION}/include/"
		"${GCC_PATH}/snos/lib/gcc/x86_64-suse-linux/${GCC_VERSION}/include/g++"
		"${GCC_PATH}/snos/lib/gcc/x86_64-suse-linux/${GCC_VERSION}/include-fixed/"
		"${GCC_PATH}/snos/lib/gcc/x86_64-suse-linux/${GCC_VERSION}/include-fixed/g++"
		"${CUDATOOLKIT_HOME}/include/"
		"${EPREFIX}/usr/include"
	)
	save_IFS=$IFS
	IFS=":"
	for dir in ${PORTAGE_READONLY_EPREFIXES}; do
		source_includes+=( "${dir}/usr/include" )
	done
	IFS=$save_IFS
	for dir in ${source_includes[@]}; do
		sed -i "61 i   cxx_builtin_include_directory: \"${dir}\"" third_party/gpus/crosstool/CROSSTOOL || die "Failed to patch third_party/gpus/crosstool/CROSSTOOL"
	done
	sed -i "s:-Wl,-rpath,third_party/gpus/cuda/lib64:-Wl,-rpath,$CUDATOOLKIT_HOME/lib64:" tensorflow/core/platform/default/build_config/BUILD || die
	echo "src_prepare"
}

python_configure_all() {
	CC="${GCC_PATH}/snos/bin/gcc"
	CXX="${GCC_PATH}/snos/bin/g++"
	tc-export CC CXX
	if use cuda; then
			export TF_NEED_CUDA=1
			export CUDA_TOOLKIT_PATH="$CUDATOOLKIT_HOME"
		save_IFS=$IFS
		IFS=':'
		prefixes="${EPREFIX}:${PORTAGE_READONLY_EPREFIXES}"
		for p in $prefixes; do
			echo "$p"
			if [ -e "${p}/usr/lib/libcudnn.so" ]; then
				prefix=$p
			fi
		done
		IFS=$save_IFS
		[ -z "$prefix" ] && die "Could not find CUDNN!"
			export CUDNN_INSTALL_PATH="${prefix}/usr"
		myconfig="--config=cuda"
	else
		export TV_NEED_CUDA=0
		myconfig=""
	fi
	./configure || die "Configure failed!"
}

python_compile() {
	if use cuda; then
		myconfig="--config=cuda"
	else
		myconfig=""
	fi
	echo `pwd`
	cd "$S"
	bazel build --nolegacy_external_runfiles -c opt $myconfig //tensorflow/tools/pip_package:build_pip_package || ( bazel shutdown && die "Compile failed" )
	bazel shutdown
}

python_install() {
	mkdir -p "${ED}"/usr/lib/${EPYTHON}/site-packages/google || die
	mkdir -p "${ED}"/usr/share/tensorflow-external || die
	cp -rL bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/org_tensorflow/tensorflow "${ED}"/usr/lib/${EPYTHON}/site-packages || die
	cp -rL bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles "${ED}"/usr/share/tensorflow-external || die
	RUNFILES=bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles

	mkdir -p ${TMPDIR}/google
	cp -rL $RUNFILES/protobuf/google/protobuf "${ED}"/usr/lib/${EPYTHON}/site-packages/google/protobuf
	echo "import sys, types, os;p = os.path.join(sys._getframe(1).f_locals['sitedir'], *('google',));ie = os.path.exists(os.path.join(p,'__init__.py'));m = not ie and sys.modules.setdefault('google', types.ModuleType('google'));mp = (m or []) and m.__dict__.setdefault('__path__',[]);(p not in mp) and mp.insert(0,p)" > "${ED}"/usr/lib/${EPYTHON}/site-packages/protobuf-3.0.0b2-py2.7-nspkg.pth
	dodoc tensorflow/tools/pip_package/README
}
