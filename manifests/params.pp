# kong parameters
class kong::params {
  $version                   = undef
  $config_dir                = '/etc/kong'
  $config_file               = 'kong.yml'
  $kong_path                 = '/usr/local/bin/kong'
  $kong_pid                  = '/usr/local/kong/kong.pid'
  $log_dir                   = '/usr/local/openresty/nginx/logs'
  $proxy_port                = 8000
  $proxy_ssl_port            = 8443
  $admin_api_port            = 8001
  $cassandra_host            = 'localhost'
  $cassandra_port            = 9042
  $database_cache_expiration = 5
  $memory_cache_size         = 128
  $service_name              = 'kong'
  $service_enable            = true
  $service_ensure            = 'running'
  $service_manage            = true
  $service_restart           = undef

  $plugins_enabled = [
    'ssl',
    'jwt',
    'acl',
    'cors',
    'oauth2',
    'tcp-log',
    'udp-log',
    'file-log',
    'http-log',
    'key-auth',
    'hmac-auth',
    'basic-auth',
    'ip-restriction',
    'mashape-analytics',
    'request-transformer',
    'response-transformer',
    'request-size-limiting',
    'rate-limiting',
    'response-ratelimiting',
  ]

  $download_url = 'https://downloadkong.org'

  # Kong don't yet have yum or apt repos for their packages so we need to know
  # what to download
  case $::operatingsystem {
    'CentOS': {
      $package_provider = 'rpm'
      $dependencies = [ 'epel-release' ]
      case $::operatingsystemmajrelease {
        '5': {
          $download_file = 'el5.noarch.rpm'
        }
        '6': {
          $download_file = 'el6.noarch.rpm'
        }
        '7': {
          $download_file = 'el7.noarch.rpm'
        }
        default: {
          fail("Class['kong::params']: Unsupported operatingsystemmajrelease ${::operatingsystemmajrelease}")
        }
      }
    }
    'Ubuntu': {
      $package_provider = 'dpkg'
      $dependencies = [
        'netcat',
        'lua5.1',
        'openssl',
        'libpcre3',
        'dnsmasq'
      ]
      case $::operatingsystemmajrelease {
        '12.04': { $download_file = 'precise_all.deb' }
        '14.04': { $download_file = 'trusty_all.deb' }
        '15.04': { $download_file = 'vivid_all.deb' }
        default: {
          fail("Class['kong::params']: Unsupported operatingsystemmajrelease ${::operatingsystemmajrelease}")
        }
      }
    }
    'Debian': {
      $package_provider = 'dpkg'
      $dependencies = [
        'netcat',
        'lua5.1',
        'openssl',
        'libpcre3',
        'dnsmasq'
      ]
      case $::operatingsystemmajrelease {
        'squeeze': { $download_file = 'squeeze_all.deb' }
        'wheezy': { $download_file = 'wheezy_all.deb' }
        'jessie': { $download_file = 'jessie_all.deb' }
        default: {
          fail("Class['kong::params']: Unsupported operatingsystemmajrelease ${::operatingsystemmajrelease}")
        }
      }
    }
    default: {
      fail("Class['kong::params']: Unsupported operatingsystem ${::operatingsystem}")
    }
  }

}
