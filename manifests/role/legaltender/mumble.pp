class wrenchies::role::legaltender::mumble {
  class { '::mumble':
    ppa      => true,
    ssl_key  => '/data/ssl/mumble/lt.key',
    ssl_cert => '/data/ssl/mumble/lt.cert',
  }

  file { '/data/ssl/mumble':
    ensure => 'directory',
    owner  => 'mumble-server',
    group  => 'mumble-server',
    mode   => '0700',
  }

  file { '/data/ssl/mumble/lt.key':
    owner => 'mumble-server',
    group => 'mumble-server',
    mode  => '0600',
    content => $::legaltender_key,
  }

  file { '/data/ssl/mumble/lt.cert':
    owner => 'mumble-server',
    group => 'mumble-server',
    mode  => '0600',
    content => $::legaltender_cert,
  }

  ini_setting { 'mumble root name':
    ensure  => present,
    path    => '/etc/mumble-server.ini',
    setting => 'registerName',
    value   => 'LegalTender',
    notify  => Service['mumble-server'],
    require => File['/etc/mumble-server.ini'],
  }
}
