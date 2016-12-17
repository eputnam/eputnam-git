class git::config (
  $config_file = $git::params::config_file
  ) inherits git {

  file { $config_file:
    ensure => file,
    content => epp('git/config.epp')
  }
}
