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
# * `manage_package`
# Defaults to true, manage the git package.
#
# * `package_ensure`
# Defaults to present, used only if `manage_package` is true
#
# * `package_name`
# Defaults to 'git', used only if `manage_package` is true
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
#      manage_package => true,
#      package_ensure => present
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
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
