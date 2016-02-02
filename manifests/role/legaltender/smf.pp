class wrenchies::role::legaltender::smf {
  class { '::smforum':
    user           => 'www-data',
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
    require        => [
      File['/opt/smforum'],
      File['/data/ssl/nginx/lt.key'],
      File['/data/ssl/nginx/lt.cert']
    ],
  }


  include '::nginx'

  file { '/opt/smforum':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0755',
  }

  nginx::resource::vhost { 'www.legaltender.net':
    ensure              => present,
    www_root            => '/data/vhost/legaltender.net/',
    location_cfg_append => { 'rewrite' => '^ https://legaltender.net$request_uri? permanent' },
  }

  file { '/data/ssl/nginx':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0700',
  }

  file { '/data/ssl/nginx/lt.key':
    ensure => 'present',
    owner => 'www-data',
    group => 'www-data',
    mode  => '0600',
    content => hiera("legaltender_key"),
  }

  file { '/data/ssl/nginx/lt.cert':
    ensure => 'present',
    owner => 'www-data',
    group => 'www-data',
    mode  => '0600',
    content => hiera("legaltender_cert"),
  }
}



