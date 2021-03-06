# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="rails init.rb VERSION VERSION_NAME"

inherit ruby-fakegem versionator

DESCRIPTION="An extension of CSS3, adding nested rules, variables, mixins, and more"
HOMEPAGE="http://sass-lang.com/"
LICENSE="MIT"

KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux"
SLOT="$(get_version_component_range 1-2)"
IUSE=""

ruby_add_bdepend "doc? ( >=dev-ruby/yard-0.5.3 )"

ruby_add_rdepend ">=dev-ruby/listen-1.3.1:1 !!<dev-ruby/haml-3.1 !!<dev-ruby/sass-3.2.19-r1:0 !!<dev-ruby/sass-3.3.14-r1:3.3"

# tests could use `less` if we had it

all_ruby_prepare() {
	rm -rf vendor/listen || die

	# Don't require maruku as markdown provider but let yard decide.
	sed -i -e '/maruku/d' .yardopts || die
}

each_ruby_test() {
	RUBOCOP=false ${RUBY} -S rake test:ruby || die
}
