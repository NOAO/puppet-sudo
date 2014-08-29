class sudo::config {
  include sudo::params
  $require = Class['sudo::install']

  file { $sudo::params::sudoers_file:
    owner   => root,
    group   => root,
    mode    => "0440",
    content => template("sudo/sudoers.erb");
  }

  # el5.x does not create this file by default and will create a 'syntax' error
  # if the #include /etc/sudoers.d directive is present but the directory is
  # not.
  file { '/etc/sudoers.d':
    owner   => root,
    group   => root,
    mode    => "0750",
    ensure  => directory,
  }
}
