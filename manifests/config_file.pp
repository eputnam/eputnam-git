define git::config_file (
  $config_file = $name,
  $user_email  = undef,
  $user_name   = undef,
  ) {
  file { $config_file:
    ensure => file,
    content => template('git/config_file.erb')
  }
}
