define drbd::resource (
  $hosts,
  $ips,
  $disks,
  $dev = '/dev/drbd0',
  $rate = '100M',
  $port = '7789',
  $metadisk = 'internal',
) {

  include drbd

  file {"${drbd::config_pool}/${title}.res":
    ensure  => present,
    content => template('drbd/resource.erb'),
  }
}
