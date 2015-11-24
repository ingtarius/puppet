class postgress_database {
   package { 'postgresql': ensure => 'installed' }
   package { 'postgresql-server': ensure => 'installed' }
   package { 'postgresql-contrib': ensure => 'installed' }
}


