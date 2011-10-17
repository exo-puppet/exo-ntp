class ntp::service {
	service {
		"ntp" :
			ensure => running,
			enable => true,
			hasstatus => true,
			hasrestart => true,
	}
	Class['ntp::install'] ~> Class['ntp::service']
}