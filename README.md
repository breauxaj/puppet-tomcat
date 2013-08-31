tomcat
======

Apache Tomcat is an open source software implementation of the Java Servlet and
JavaServer Pages technologies.

Samples
-------

include tomcat
include tomcat::native

tomcat::service { 'default': ensure => running, enable => true }

tomcat::config { 'default':
  runas         => 'deploy',
  catalina_home => '/usr/local/tomcat',
  catalina_base => '/var/tomcat',
}
