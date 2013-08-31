class tomcat {
  Class['tomcat']->Class['java']

  file { '/etc/init.d/tomcat':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/tomcat/tomcat.init'
  }

}

define tomcat::service ( $ensure,
                         $enable ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tomcat',
  }
    
  service { $service:
    ensure    => $ensure,
    enable    => $enable,
  }

}

define tomcat::config ( $runas = 'deploy',
                        $catalina_home = '/usr/local/tomcat' ) {
  file { '/etc/sysconfig/tomcat':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("tomcat/sysconfig.erb"),
  }

  file { '/etc/profile.d/tomcat.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => template("tomcat/profile.erb"),
  }

}
