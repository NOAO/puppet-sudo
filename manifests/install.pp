class sudo::install {
  include sudo::params

  package { $sudo::params::sudo_package:
    ensure => present,
  }
}
