class lucid32_base {
  
  $host = "magento.dev"
  $db_root_password = "root"

  $source_directory = "/vagrant/project"
  $site_url = "http://${host}/"

  $eshop_admin_login = "admin"
  $eshop_admin_password = "admin"
  $eshop_admin_email = "email@email.com"

  # setup the document root
  $root_document = "${source_directory}/web"

  package { "wget": ensure => "present", }

  # puppet complains about a missing puppet group so create it
  group { 'puppet': ensure => 'present' }

  # packages are not update to date out of the box
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  # setup hosts for $host and www.$host having www.$host and $host map to the same site
  host { "$host":
    ensure => "present",
    ip => "127.0.0.1",
    host_aliases => [ "www.$host"],
  }

  include mysql
#  include php
#  include svn
#  include config
#  include magento


}

include lucid32_base
