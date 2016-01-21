kong
====

This puppet module installs and configures [Kong](https://getkong.org/).

It currently does not manage the service as init scripts are not provided.

Mashape does not currently supply yum or apt repositores, so relevant package
for the target platform s downloaded with wget and installed with rpm or dpkg.
For this reason, this module cannot manage package update easily as the dpkg
provider does not support the *'versionable'* feature.

**IMPORTANT:** This is a work in progress and has only been tested on CentOS 6 and Ubuntu Trusty (14.04), but should work on Debian. I will be testing with CentOS 5 and 7, other Ubuntu LTS releases and Debian at some point.

## Parameters

* `version`: Default: 'installed'
* `config_dir`: Default: '/etc/kong'
* `config_file`: Default: 'kong.yml'
* `kong_path`: Default: '/usr/local/bin/kong'
* `kong_pid`: Default: '/usr/local/kong/kong.pid'
* `log_dir`: Default: '/usr/local/openresty/nginx/logs'
* `proxy_port`: Default: 8000
* `proxy_ssl_port`: Default: 8443
* `admin_api_port`: Default: 8001
* `cassandra_host`: Default: 'localhost'
* `cassandra_port`: Default: 9042
* `database_cache_expiration`: Default: 5
* `memory_cache_size`: Default: 128
* `service_name`: Default: 'kong'
* `service_enable`: Default: true
* `service_ensure`: Default: 'running'
* `service_manage`: Default: true
* `service_restart`: Default: undef 
* `plugins_enabled`: Default: all plugins:
    * 'ssl'
    * 'jwt'
    * 'acl'
    * 'cors'
    * 'oauth2'
    * 'tcp-log'
    * 'udp-log'
    * 'file-log'
    * 'http-log'
    * 'key-auth'
    * 'hmac-auth'
    * 'basic-auth'
    * 'ip-restriction'
    * 'mashape-analytics'
    * 'request-transformer'
    * 'response-transformer'
    * 'request-size-limiting'
    * 'rate-limiting'
    * 'response-ratelimiting'
* `download_url`: Default: 'https://downloadkong.org'
* `dependencies`: Default:
    * CentOS/RHEL:
        * 'wget'
        * 'epel-release'
    * Ubuntu:
        * 'wget'
        * 'netcat'
        * 'lua5.1'
        * 'openssl'
        * 'libpcre3'
        * 'dnsmasq'
    * Debian:
        * 'wget'
        * 'netcat'
        * 'lua5.1'
        * 'openssl'
        * 'libpcre3'
        * 'dnsmasq'
* `download_file`: Defaults:
    * CentOS/RHEL
        * 5: 'el5.noarch.rpm'
        * 6: 'el6.noarch.rpm'
        * 7: 'el7.noarch.rpm'
    * Ubuntu:
        * 12.04: 'precise_all.deb'
        * 14.04: 'trusty_all.deb'
        * 15.04: 'vivid_all.deb'
    * Debian:
        * squeeze: 'squeeze_all.deb'
        * wheezy: 'wheezy_all.deb'
        * jessis: 'jessie_all.deb'


## TODO

- Create init scripts for Ubuntu/Debian and CentOS/RHEL so we can manage the service
- Improve installation/upgrades
- Add more parameters for kong.yml

## License

MIT