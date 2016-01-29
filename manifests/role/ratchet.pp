class wrenchies::role::ratchet {
  dir { [
    '/data/',
    '/data/logs',
    '/data/vhosts',
    ]:
      ensure => 'directory',
      owner  => 'root',
      mode   => '0755',
  }
}
