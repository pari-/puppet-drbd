class drbd (
  $ensure                 = $drbd::params::ensure,
  $package                = $drbd::params::package,
  $auto_upgrade           = $drbd::params::auto_upgrade,
  $config                 = $drbd::params::config,
  $config_pool            = $drbd::params::config_pool,
  $service_name           = $drbd::params::service_name,
  $service_ensure         = $drbd::params::service_ensure,
  $service_enable         = $drbd::params::service_enable
) inherits drbd::params {

  class {'drbd::package':}
  class {'drbd::config':}
  class {'drbd::service':}

  if $ensure == 'present' {
    Class['drbd::package'] -> Class['drbd::config'] ~> Class['drbd::service']
  } else {
    Class['drbd::service'] -> Class['drbd::package']
  }
}

