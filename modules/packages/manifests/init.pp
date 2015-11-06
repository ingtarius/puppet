class packages {

  package { 'screen': ensure => 'installed' }
  package { 'strace': ensure => 'installed' }
  package { 'sudo':   ensure => 'installed' }
  package { 'openssh-client':   ensure => 'installed' }
  package { 'dnsutils':   ensure => 'installed' }
  package { 'vim':   ensure => 'installed' }
}
