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
# @param manage_package decide whether to manage the git package
# @param package_ensure ensure for package resource
# @param package_name name of package if not git
class git (
  $package_ensure = 'installed',
  $package_name   = 'git',
  $manage_package = true
) {

  validate_bool($manage_package)

  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
