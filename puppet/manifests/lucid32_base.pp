class lucid32_base {
  
  $host = "magento.dev"
  #$project = "magento"
  $db_root_password = "root"
  #$user = "admin"
  #$user1password = "admin"
  #$user1mail = "admin@mailinator.com"
  $source_directory = "/vagrant"
  $site_url = "http://${host}/"

  # setup the document root
  $root_document = "${source_directory}/magento"

  package { "wget":
    ensure => "present",
  }

  # setup hosts for $host and www.$host having www.$host and $host map to the same site
  host { "$host":
    ensure => "present",
    ip => "127.0.0.1",
    host_aliases => [ "www.$host"],
  }

  include mysql
  include php
  include svn
  include config
  include magento


}

include lucid32_base
