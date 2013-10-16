class tomcat {
  file { '/etc/init.d/tomcat':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/tomcat/tomcat.init'
  }

}
