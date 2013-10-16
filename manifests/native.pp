class tomcat::native {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tomcat-native',
  }

  package { $required: ensure => latest }

}
