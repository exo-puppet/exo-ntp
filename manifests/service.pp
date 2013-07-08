# Class: ntp::service
#
# This class manage the ntp service
class ntp::service {
  service { 'ntp':
    ensure     => running,
    name       => $ntp::params::service_name,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['ntp::config'],
  }
}
