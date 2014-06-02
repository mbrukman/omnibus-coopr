
name 'loom-ui'
maintainer 'Continuuity'
homepage 'http://github.com/continuuity/loom'

replaces 'loom-ui'
install_path '/opt/loom'
# build_version   Omnibus::BuildVersion.new.semver
build_version '0.9.7'
build_iteration 1

# creates required build directories
dependency 'preparation'

# loom-provisioner dependencies/components
# dependency "somedep"
dependency 'loom-ui'

exclude "\.git*"
exclude "bundler\/git"
