class git::install (
  $ensure       = $git::params::package_ensure,
  $package_name = $git::params::package_name
  ) inherits git {
    package { $package_name:
      ensure => $ensure
    }
}
