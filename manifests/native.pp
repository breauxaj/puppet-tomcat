class tomcat::native {
  Class['tomcat::native']->Class['tomcat']

  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'tomcat-native' ],
  }

  package { $required: ensure => latest }

}
