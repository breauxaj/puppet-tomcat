define tomcat::users (
  $owner = 'deploy',
  $group = 'deploy',
  $users = '',
  $catalina_home = ''
) {
  file { "${catalina_home}/conf/tomcat-users.xml":
    ensure  => present,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    content => template('tomcat/tomcat-users.erb'),
  }

}
