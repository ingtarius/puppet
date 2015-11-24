class default_conf {
  package { 'screen': ensure => 'installed' }
  package { 'strace': ensure => 'installed' }
  package { 'sudo':   ensure => 'installed' }
  package { 'openssh-clients':   ensure => 'installed' }
  package { 'bind-utils':   ensure => 'installed' }
  package { 'cronie':   ensure => 'installed' }
  package { 'cronie-noanacron':   ensure => 'installed' }
  package { 'crontabs':   ensure => 'installed' }
  package { 'rsync':   ensure => 'installed' }
  package { 'tcpdump':   ensure => 'installed' }

 cron { 'puppet_update':   
  	command => "puppet agent --test",   
  	user    => root,
  	hour    => '*',
	minute  => '*/15',}
}
