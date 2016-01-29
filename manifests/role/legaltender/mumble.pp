class wrenchies::role::legaltender::mumble {
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
    content => hiera("legaltender_key"),
  }

  file { '/data/ssl/mumble/lt.cert':
    ensure => 'present',
    owner => 'mumble-server',
    group => 'mumble-server',
    mode  => '0600',
    content => hiera("legaltender_cert"),
  }
}
