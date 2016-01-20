class wrenchies::role::ratchet {
  # set mumble root name

  ini_setting { 'mumble root name':
    ensure  => present,
    path    => '/etc/mumble-server.ini',
    setting => 'registerName',
    value   => 'LegalTender',
    notify  => Service['mumble-server'],
    require => Package['mumble-server'],
  }
}
