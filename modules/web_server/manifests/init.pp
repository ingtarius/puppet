class web_server {
   package { nginx: ensure => installed }

   service { nginx:
      name => nginx,
      enable => true,
      ensure => running,
   }

   file { "/etc/nginx/conf.d/wordpress.conf":
      notify => Service['nginx'],
      mode => "0644",
      owner => "root",
      group => "root",
      require => Package['nginx'],
      source => "puppet:///modules/web_server/wordpress.conf",
   }

}
