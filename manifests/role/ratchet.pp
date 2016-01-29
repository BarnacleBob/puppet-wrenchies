class wrenchies::role::ratchet {
  file { [
    '/data/',
    '/data/logs',
    '/data/vhosts',
    '/data/ssl',
    ]:
      ensure => 'directory',
      owner  => 'root',
      mode   => '0755',
  }


}
