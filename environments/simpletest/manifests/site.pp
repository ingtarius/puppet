# FIX https://ask.puppetlabs.com/question/6640/warning-the-package-types-allow_virtual-parameter-will-be-changing-its-default-value-from-false-to-true-in-a-future-release/
if versioncmp($::puppetversion,'3.6.1') >= 0 {

  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

node 'nginx-front' {
  include default_conf
  include web_server
  class { 'sysctl':
    sysctl_name => 'net.nf_conntrack_max', 
    sysctl_value => '655360',
  }
}

node 'base1' {
  include default_conf
  include postgress_database
  pgbouncer_m {
    'server02':
      enabled       => true,
      config_source => 'puppet:///files/configs/avi-sql/pgbouncer02.ini_repca',
      niceness      => '-20',
  }

}

node 'base-pgbouncer-test1' {
  include default_conf
  include postgress_database
  pgbouncer_m {
    'server02':
      enabled       => true,
      config_source => 'puppet:///files/configs/avi-sql/pgbouncer02.ini_repca',
      niceness      => '-20',
  }

}

node 'base-pgbouncer-test2' {
  include default_conf
  include postgress_database
  pgbouncer_m {
    'server02':
      enabled       => true,
      config_source => 'puppet:///files/configs/avi-sql/pgbouncer02.ini_repca',
      niceness      => '-20',
  }

}

node 'base-pgbouncer-test3' {
  include default_conf
  include postgress_database
  pgbouncer_m {
    'server02':
      enabled       => true,
      config_source => 'puppet:///files/configs/avi-sql/pgbouncer02.ini_repca',
      niceness      => '-20',
  }

}


node 'app' {
   include default_conf
   include app_node
}
