define tomcat::users (
  $users = '',
  $catalina_home = ''
) {
  file { "${catalina_home}/conf/tomcat-users.xml":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/tomcat-users.erb'),
  }

}
