# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)
inherit distutils-r1

DESCRIPTION="Reliable Asynchronous Event Transport Protocol"
HOMEPAGE="https://github.com/saltstack/raet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/six-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/libnacl-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/ioflo-0.9.35[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/unittest2[${PYTHON_USEDEP}] )"

python_test() {
	pushd ${PN} || die "could not find tests for ${EPYTHON}"
	${EPYTHON} test/__init__.py || die "tests failed for ${EPYTHON}"
	popd
}
