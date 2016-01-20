class wrenchies::role::puppetmaster {
  ini_setting { "hieraconf":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'hiera_config',
    value   => '/etc/puppetlabs/hiera.yaml',
    notify  => Class["Puppet_enterprise::Master::Puppetserver"],
  }

}
