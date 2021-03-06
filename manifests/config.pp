# == Class: docker::config
#
class docker::config {
  file { '/etc/sysconfig/docker':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/sysconfig/docker.erb"),
  }

  file { '/etc/sysconfig/docker-storage':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/sysconfig/docker-storage.erb"),
    require => Service['docker-storage-setup'],
  }

  file { '/etc/sysconfig/docker-network':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/sysconfig/docker-network.erb"),
  }
}
