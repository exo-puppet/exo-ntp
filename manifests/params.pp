# Class: ntp::params
#
# This class manage the ntp parameters for different OS
class ntp::params {
  $ensure_mode = $ntp::lastversion ? {
    true    => latest,
    default => present
  }
  # notify { "ntp ensure mode = $ensure_mode": withpath => false }
  info("ntp ensure mode = ${ensure_mode}")

  $package_name = [
    'ntp']
  $config_file  = '/etc/ntp.conf'

  case $::operatingsystem {
    /(Ubuntu|Debian)/ : {
      $service_name    = 'ntp'
      $config_template = 'ntp.conf.debian.erb'
      $servers         = $ntp::servers ? {
        'UNSET' => [
          '0.debian.pool.ntp.org iburst',
          '1.debian.pool.ntp.org iburst',
          '2.debian.pool.ntp.org iburst',
          '3.debian.pool.ntp.org iburst',],
        default => $ntp::servers
      } }
    /(Centos|Redhat)/ : {
      $service_name    = 'ntpd'
      $config_template = 'ntp.conf.el.erb'
      $servers         = $ntp::servers ? {
        'UNSET' => [
          '0.centos.pool.ntp.org',
          '1.centos.pool.ntp.org',
          '2.centos.pool.ntp.org',],
        default => $ntp::servers
      } }
    default           : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}
