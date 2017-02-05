define git::config_file (
  $config_file = $name,
  $user        = undef,
  $aliases     = []
  ) {

  if Git::User[$user] {
    file { $config_file:
      ensure  => file,
      content => epp('git/config_file.epp', {
        'user_email' => Git::User[$user][$email],
        'user_name'  => Git::User[$user][$email],
        'aliases'    => $aliases })
    }
  } else {
    fail("User must exist.")
  }

}
