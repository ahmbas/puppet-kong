# kong config
class kong::config inherits kong {

  file { $kong::config_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  file { "${kong::config_dir}/${kong::config_file}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("${module_name}/${kong::config_file}.erb"),
    require => File[$kong::config_dir],
    notify  => Service['kong'],
  }

  file { '/etc/logrotate.d/kong':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/logrotate.erb"),
  }

}
