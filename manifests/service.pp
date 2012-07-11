class drbd::service {
  service { 'drbd':
    ensure     => $drbd::service_ensure,
    name       => $drbd::service_name,
    hasstatus  => true,
    hasrestart => true,
    enable     => $drbd::service_enable,
  }
}
