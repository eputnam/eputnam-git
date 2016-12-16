class git::config inherits git {
  file { $config_file:
    ensure => file,
    content => "git config",
  }
}
