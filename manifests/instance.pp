define tomcat::instance (
  $owner = 'deploy',
  $group = 'deploy',
  $catalina_home = '/usr/local/tomcat',
  $catalina_base = '/var/tomcat'
) {
  $paths = [
    '/var/log/tomcat',
    "${catalina_base}",
    "${catalina_base}/lib",
    "${catalina_base}/temp",
    "${catalina_base}/webapps",
    "${catalina_base}/work"
  ]

  file { $paths:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0755',
  }

  file { 'confs':
    ensure  => present,
    path    => "${catalina_base}/conf",
    owner   => $owner,
    group   => $group,
    mode    => '0664',
    replace => 'no',
    source  => "${catalina_home}/conf",
    recurse => true,
  }

  file { "${catalina_base}/logs":
    ensure => 'link',
    owner  => $owner,
    group  => $group,
    target => '/var/log/tomcat',
  }

  file { "${catalina_base}/webapps/probe.war":
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
    source => 'puppet:///modules/tomcat/probe.war',
  }

}
