# Main kong class
class kong (
  $version                   = $kong::params::version,
  $config_dir                = $kong::params::config_dir,
  $config_file               = $kong::params::config_file,
  $kong_path                 = $kong::params::kong_path,
  $kong_pid                  = $kong::params::kong_pid,
  $log_dir                   = $kong::params::log_dir,
  $proxy_port                = $kong::params::proxy_port,
  $proxy_ssl_port            = $kong::params::proxy_ssl_port,
  $admin_api_port            = $kong::params::admin_api_port,
  $cassandra_host            = $kong::params::cassandra_host,
  $cassandra_port            = $kong::params::cassandra_port,
  $database_cache_expiration = $kong::params::database_cache_expiration,
  $memory_cache_size         = $kong::params::memory_cache_size,
  $download_url              = $kong::params::download_url,
  $download_file             = $kong::params::download_file,
  $service_name              = $kong::params::service_name,
  $service_enable            = $kong::params::service_enable,
  $service_ensure            = $kong::params::service_ensure,
  $service_manage            = $kong::params::service_manage,
  $service_restart           = $kong::params::service_restart,
) inherits kong::params {

  validate_bool($service_enable)
  validate_bool($service_manage)
  validate_integer($proxy_port)
  validate_integer($proxy_ssl_port)
  validate_integer($admin_api_port)
  validate_integer($cassandra_port)
  validate_absolute_path($config_dir)
  validate_absolute_path($kong_path)
  validate_absolute_path($kong_pid)
  validate_absolute_path($log_dir)
  validate_integer($memory_cache_size)
  validate_integer($database_cache_expiration)

  class { '::kong::install': } ->
  class { '::kong::config': } ->
  class { '::kong::service': }

}
