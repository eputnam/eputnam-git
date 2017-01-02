define git::config_file (
  $config_file = $name,
  $user_email  = undef,
  $user_name   = undef,
  ) {
  file { $config_file:
    ensure  => file,
    content => epp('git/config_file.epp', {
      'user_email' => $user_email,
      'user_name'  => $user_name })
  }
}
