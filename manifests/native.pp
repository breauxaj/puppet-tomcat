class tomcat::native (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tomcat-native',
  }

  package { $required: ensure => $ensure }

}
