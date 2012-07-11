class drbd::package {
  if $drbd::ensure == 'present' {
    $package_ensure = $drbd::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$drbd::package:
    ensure  => $package_ensure,
  }
}
