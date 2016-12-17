# Class: git
# ===========================
#
# Full description of class git here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this git would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'git':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name Eric Putnam <putnam.eric@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Eric Putnam
#
class git (
  $package_ensure = $git::params::package_ensure,
  $package_name   = $git::params::package_name,
  $manage_package = $git::params::manage_package
) inherits git::params {

  validate_bool($manage_package)

  if $manage_package {
    include git::install
  }
}
