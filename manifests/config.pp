define tomcat::config (
  $runas = 'deploy',
  $catalina_home = '/usr/local/tomcat',
  $catalina_base = '/usr/local/tomcat',
  $java_opts = ''
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tomcat',
  }

  file { '/etc/sysconfig/tomcat':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/sysconfig.erb'),
    notify  => Service[$service],
  }

  file { '/etc/profile.d/tomcat.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/profile.erb'),
    notify  => Service[$service],
  }

}
