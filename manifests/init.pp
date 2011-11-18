# Class: ntp
#
#   This module manages the ntp service.
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
# Parameters:
#	$servers = [ "0.debian.pool.ntp.org iburst",
#                "1.debian.pool.ntp.org iburst",
#                "2.debian.pool.ntp.org iburst",
#                "3.debian.pool.ntp.org iburst", ]
#	$lastversion:
#		this variable allow to chose if the package should always be updated to the last available version (true) or not (false) (default: false)
#
# Actions:
#
#  Installs, configures, and manages the ntp service.
#
# Requires:
#
# Sample Usage:
#
#   class { "ntp":
#     servers    => [ 'time.apple.com' ],
#     lastversion => false,
#   }
#
# [Remember: No empty lines between comments and class definition]
class ntp ($servers="UNSET", $lastversion=false) {
	# parameters validation
	if ($lastversion != true) and ($lastversion != false) {
		fail("lastversion must be true or false")
	}

	# submodules 
	include ntp::params, ntp::install, ntp::config, ntp::service
}
