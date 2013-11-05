tomcat
======

Apache Tomcat is an open source software implementation of the Java Servlet and
JavaServer Pages technologies.

Samples
-------
```
include tomcat
```
```
include tomcat::native
```
```
tomcat::service { 'default': ensure => running, enable => true }
```
```
tomcat::config { 'default':
  runas         => 'deploy',
  catalina_home => '/usr/local/tomcat',
  catalina_base => '/var/tomcat',
  java_opts     => [
    '-d64',
    '-Xms256m',
    '-Xmx512m',
    '-XX:NewSize=128m',
    '-XX:MaxNewSize=256m',
    '-XX:MaxPermSize=128m',
    '-XX:NewRatio=2',
    '-Dsun.rmi.dgc.client.gcInterval=7200000',
    '-Dcom.sun.management.jmxremote',
    '-XX:-BindGCTaskThreadsToCPUs',
    '-XX:ParallelGCThreads=4',
    '-XX:+UseConcMarkSweepGC',
    '-XX:+CMSClassUnloadingEnabled',
    '-XX:+CMSPermGenSweepingEnabled',
    '-XX:+CMSIncrementalMode',
    '-XX:+CMSIncrementalPacing',
    '-XX:CMSIncrementalDutyCycleMin=2',
    '-XX:CMSIncrementalDutyCycle=10',
    '-XX:CMSIncrementalSafetyFactor=20',
    '-XX:MinHeapFreeRatio=20',
    '-XX:+PrintClassHistogram',
    '-XX:+PrintGCDetails',
    '-XX:+PrintGCTimeStamps',
    '-XX:+PrintTenuringDistribution',
    '-XX:+PrintAdaptiveSizePolicy',
    '-XX:+PrintGCApplicationConcurrentTime',
    '-XX:+PrintGCApplicationStoppedTime',
  ]
}
```
```
$users = {
  u1 => { username => 'admin', password => 'admin', roles => 'admin,manager' },
}
```
```
tomcat::users { 'default':
  users         => $users,
  catalina_home => '/var/tomcat',
}
```
tomcat::instance { 'default':
  owner         => 'deploy',
  group         => 'deploy',
  catalina_home => '/usr/local/tomcat',
  catalina_base => '/var/tomcat'
}
```