class fail2ban::install {
	package {
		"ntp" :
			ensure => present,
	}
}

