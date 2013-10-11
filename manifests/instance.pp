define tomcat::instance (
  $owner = 'deploy',
  $group = 'deploy',
  $catalina_home = '/usr/local/tomcat',
  $catalina_base = '/var/tomcat'
) {
  file { '/usr/local/bin/instance.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    content => template('tomcat/instance.erb'),
  }

  exec { 'deploy-tomcat':
    path    => '/bin:/usr/bin',
    command => "virtualenv --no-site-packages ${path}/${name} ; chown -R ${user}:${group} ${path}/${name}",
    cwd     => $path,
    creates => "${path}/${name}/bin/python",
    require => File['/usr/local/bin/instance.sh'],
  }

}
