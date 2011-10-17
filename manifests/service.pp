class fail2ban::service {
	service {
		"ntp" :
			ensure => running,
			enable => true,
			hasstatus => true,
			hasrestart => true,
	}
	Class['ntp::install'] ~> Class['fail2ban::service']
}