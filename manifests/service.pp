# == Class: docker::service
#
# Class to manage the docker service daemon
#
class docker::service {
  service { 'docker-storage-setup':
    ensure  => $docker::service_state_storage,
    enable  => $docker::service_enable_storage,
    require => Package['docker'],
  }

  service { 'docker':
    ensure  => $docker::service_state,
    enable  => $docker::service_enable,
    require => Service['docker-storage-setup'],
  }
}
