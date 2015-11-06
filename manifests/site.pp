node 'test1' {
  include packages
}

node 'front' {
  include packages
  include web_server
}

node 'base' {
  include packages
}
