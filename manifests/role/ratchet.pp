class wrenchies::role::ratchet {
  file { [
    '/data/',
    '/data/logs',
    '/data/vhosts',
    ]:
      ensure => 'directory',
      owner  => 'root',
      mode   => '0755',
  }
}
