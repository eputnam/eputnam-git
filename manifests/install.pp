class git::install (
  $package_ensure = $git::package_ensure,
  $package_name   = $git::package_name
) inherits git {
    package { $package_name:
      ensure => $ensure
    }
}
