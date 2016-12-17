class git::config (
  $config_file = $git::params::config_file
  ) inherits git {

  file { $config_file:
    ensure => file,
    content => "git config",
  }
}
