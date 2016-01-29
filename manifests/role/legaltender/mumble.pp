class wrenchies::role::legaltender::mumble {

  class { '::mumble':
    ppa => true,
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
