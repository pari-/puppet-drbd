class drbd::config {
  file {$drbd::config:
    ensure => 'present',
    owner  => 0,
    group  => 0,
    source => 'puppet:///modules/drbd/drbd.conf',
  }

  file {$drbd::config_pool:
    ensure  => directory,
    owner   => 0,
    group   => 0,
    recurse => true,
    purge   => true,
    force   => true,
  }

}

