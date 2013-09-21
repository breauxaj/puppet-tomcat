define tomcat::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tomcat',
  }

  service { $service:
    ensure    => $ensure,
    enable    => $enable,
  }

}
