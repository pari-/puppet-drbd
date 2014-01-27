define drbd::resource (
  $hosts,
  $ips,
  $disks,
  $dev = '/dev/drbd0',
  $rate = '100M',
  $port = '7789',
  $metadisk = 'internal',
  $options = []
) {

  include drbd

  file {"${drbd::config_pool}/${title}.res":
    ensure  => present,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('drbd/resource.erb'),
  }
}
