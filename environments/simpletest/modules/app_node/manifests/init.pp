class app_node {
   package { 'php': ensure => 'installed' }
   package { 'php-fpm': ensure => 'installed' }
   package { 'nginx': ensure => 'installed' }

   service { nginx:
      name => nginx,
      enable => true,
      ensure => running,
   }

   service { php-fpm:
      name => php-fpm,
      enable => true,
      ensure => running,
   }


# Deploy nginx config and php-fpm config

   file { "/etc/php-fpm.d/www.conf":
      notify => Service['php-fpm'],
      mode => "0644",
      owner => "root",
      group => "root",
      require => Package['nginx'],
      source => "puppet:///modules/app_node/www-wordpress.conf",
   }

   file { "/etc/nginx/conf.d/app_wordpress.conf":
      notify => Service['nginx'],
      mode => "0644",
      owner => "root",
      group => "root",
      require => Package['nginx'],
      source => "puppet:///modules/app_node/app_wordpress",

   }

   file { "/etc/nginx/nginx.conf":
      notify => Service['nginx'],
      mode => "0644",
      owner => "root",
      group => "root",
      require => Package['nginx'],
      source => "puppet:///modules/app_node/default.conf",
   }


}
