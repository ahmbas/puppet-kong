# Class: kong::service
#
# Manages the kong daemon
#
# Parameters:
#
# Actions:
#   - Manage kong service
#
# Requires:
#
# Sample Usage:
#
#    sometype { 'foo':
#      notify => Class['kong::service'],
#    }
#
#
class kong::service inherits kong {

  case $kong::service_ensure {
    true, false, 'running', 'stopped': {
      $_service_ensure = $kong::service_ensure
    }
    default: {
      $_service_ensure = undef
    }
  }

  if $kong::service_manage {
    service { 'kong':
      ensure  => $_service_ensure,
      name    => $kong::service_name,
      #enable  => $kong::service_enable, # TODO: Disabled until we have init scripts
      start   => "${kong::kong_path} start",
      stop    => "${kong::kong_path} stop",
      restart => "${kong::kong_path} restart",
      status  => "ls ${kong::kong_pid}",
    }
  }

}
