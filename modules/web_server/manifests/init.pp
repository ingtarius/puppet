class web_server {
   package { nginx: ensure => installed }

   service { nginx:
      name => nginx,
      enable => true,
      ensure => running,
   }
}
