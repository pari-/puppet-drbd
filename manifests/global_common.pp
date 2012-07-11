class drbd::global_common (
  $global,
  $common,
) {
  file {"${drbd::config_pool}/global_common.conf":
    ensure  => present,
    content => template('drbd/global_common.erb'),
    require => Class['drbd::config'],
    notify  => Class['drbd::service'],
  }
  
  Class['drbd::global_common'] -> Class['drbd']

}
