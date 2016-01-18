# Install kong
class kong::install inherits kong {

  ensure_packages('wget')
  ensure_packages($dependencies)

  # Download kong package unless it appears to be installed
  exec { 'download-kong':
    path        => [ '/bin', '/usr/bin' ],
    command     => "wget ${kong::download_url}/${kong::download_file} -O /tmp/${kong::download_file}",
    creates     => "/tmp/$kong::download_file",
    unless      => "test -d /usr/local/kong",
    require     => Package['wget'],
    before      => Package['kong'],
    notify      => Package['kong'],
  }

  # Install kong package
  package { 'kong':
    ensure   => $kong::version,
    provider => $kong::package_provider,
    source   => "/tmp/${kong::download_file}",
    notify   => Exec['remove-kong-download'],
  }

  # Remove kong package file
  exec { 'remove-kong-download':
    path        => [ '/bin', '/usr/bin' ],
    command     => "rm /tmp/${kong::download_file}",
    onlyif      => "test -f /tmp/${kong::download_file}",
    refreshonly => true,
  }

}
