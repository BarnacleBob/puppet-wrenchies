class wrenchies::role::legaltender::smf {
  class { "::smforum": }

  include "::nginx"

  nginx::resource::vhost { "www.legaltender.net":
    ensure              => present,
    www_root            => '/data/vhost/legaltender.net/',
    location_cfg_append => { 'rewrite' => '^ https://legaltender.net$request_uri? permanent' },
  }
}
