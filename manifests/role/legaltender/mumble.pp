class wrenchies::role::legaltender::mumble(
  $ssl_cert,
  $ssl_key,
){
  class { '::mumble':
    ppa           => true,
    ssl_key       => '/data/ssl/mumble/lt.key',
    ssl_cert      => '/data/ssl/mumble/lt.cert',
    register_name => 'LegalTender',
  }

  file { '/data/ssl/mumble':
    ensure => 'directory',
    owner  => 'mumble-server',
    group  => 'mumble-server',
    mode   => '0700',
  }

  file { '/data/ssl/mumble/lt.key':
    ensure => 'present',
    owner => 'mumble-server',
    group => 'mumble-server',
    mode  => '0600',
    content => $ssl_key,
  }

  file { '/data/ssl/mumble/lt.cert':
    ensure => 'present',
    owner => 'mumble-server',
    group => 'mumble-server',
    mode  => '0600',
    content => $ssl_cert,
  }
}
