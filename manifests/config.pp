class drbd::config {
  file {$drbd::config:
    ensure  => 'present',
    source  => 'puppet:///modules/drbd/drbd.conf',
  }

  file {$drbd::config_pool:
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
  }

}

