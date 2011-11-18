# Class: ntp::config
#
# This class manage the ntp configuration
class ntp::config {
	file { $ntp::params::config_file:
		ensure => file,
		owner  => root,
		group  => root,
		mode   => 0644,
		content => template("ntp/$ntp::params::config_template"),
		require => Class["ntp::install"],
		notify => Class["ntp::service"],
	}
}
