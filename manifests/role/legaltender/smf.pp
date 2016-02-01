class wrenchies::role::legaltender::smf {
  class { '::smforum':
    user           => 'nobody',
    document_root  => '/opt/smforum',
    manage_mysql   => true,
    mysql_user     => 'smforum',
    mysql_db       => 'smforum',
    mysql_password => 'legaltendersmforum',
    include_php    => true,
    manage_vhost   => true,
    vhost_ssl      => true,
    vhost_ssl_only => true,
    vhost_fqdn     => 'legaltender.net',
    vhost_type     => 'nginx',
    vhost_ssl_key  => '/data/ssl/nginx/lt.key',
    vhost_ssl_cert => '/data/ssl/nginx/lt.cert',
  }

  include '::nginx'

  nginx::resource::vhost { 'www.legaltender.net':
    ensure              => present,
    www_root            => '/data/vhost/legaltender.net/',
    location_cfg_append => { 'rewrite' => '^ https://legaltender.net$request_uri? permanent' },
  }

  file { '/data/ssl/nginx':
    ensure => 'directory',
    owner  => 'nginx-server',
    group  => 'nginx-server',
    mode   => '0700',
  }

  file { '/data/ssl/nginx/lt.key':
    ensure => 'present',
    owner => 'nginx-server',
    group => 'nginx-server',
    mode  => '0600',
    content => hiera("legaltender_key"),
  }

  file { '/data/ssl/nginx/lt.cert':
    ensure => 'present',
    owner => 'nginx-server',
    group => 'nginx-server',
    mode  => '0600',
    content => hiera("legaltender_cert"),
  }
}
