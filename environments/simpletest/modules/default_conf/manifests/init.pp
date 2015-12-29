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
  package { 'at':   ensure => 'installed' }

 cron { 'puppet_update':   
  	command => "puppet agent --test",   
  	user    => root,
  	hour    => '*',
	minute  => '*/15',}

 file { "/root/file_password":
    mode   => 440,
    owner  => root,
    group  => root,
    source => "puppet:///modules/default_conf/file_password"
}

 file { "/usr/local/bin/puppet-disable":
    mode   => 0700,
    owner  => root,
    group  => root,
    source => "puppet:///modules/default_conf/puppet-disable"
}

 file { "/usr/local/bin/puppet-enable":
    mode   => 0700,
    owner  => root,
    group  => root,
    source => "puppet:///modules/default_conf/puppet-enable"
}

}
