class drbd::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_enable = true
  $service_ensure = 'running'

  case $::osfamily {
    'Debian': {
      $package = [ 'drbd8-utils' ]
      $config = '/etc/drbd.conf'
      $config_pool = '/etc/drbd.d'
      $service_name = 'drbd'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::osfamily}\"")
    }
  }

}
