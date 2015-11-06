node 'test1' {
  include packages
}

node 'front' {
  include packages
  include web_server
  include php
}

node 'base' {
  include packages
}
