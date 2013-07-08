# Class: ntp::install
#
# This class manage the installation of the ntp package
class ntp::install {
  package { 'ntp':
    ensure  => $ntp::params::ensure_mode,
    require => Exec['repo-update'],
  }
}
