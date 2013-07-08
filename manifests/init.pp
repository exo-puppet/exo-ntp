################################################################################
#
#   This module manages the ntp service.
#
#   Tested platforms:
#    - Ubuntu 11.10 Oneiric
#    - Ubuntu 11.04 Natty
#    - Ubuntu 10.04 Lucid
#
# == Parameters
# [+servers+]
#       (OPTIONAL) (default: [ "0.debian.pool.ntp.org iburst", "1.debian.pool.ntp.org iburst", "2.debian.pool.ntp.org iburst",
#       "3.debian.pool.ntp.org iburst", ])
#
# [+lastversion+]
#       (OPTIONAL) (default: false)
#
#       this variable allow to chose if the package should always be updated to the last available version (true) or not (false)
#       (default: false)
#
# == Modules Dependencies
#
# [+repo+]
#   the +repo+ puppet module is needed to :
#
#   - refresh the repository before installing package (in ntp::install)
#
# == Examples
#
#   class { "ntp":
#       servers     => [ "time.apple.com" ],
#       lastversion => true,
#   }
#
################################################################################
class ntp (
  $servers     = 'UNSET',
  $lastversion = false) {
  # parameters validation
  if ($lastversion != true) and ($lastversion != false) {
    fail('lastversion must be true or false')
  }

  include repo

  include ntp::params, ntp::install, ntp::config, ntp::service
}
