# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy )

inherit python-r1

DESCRIPTION="A virtual for the Python functools.singledispatch function"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND="$(python_gen_cond_dep 'dev-python/singledispatch[${PYTHON_USEDEP}]' python2_7 python3_3 pypy)"
