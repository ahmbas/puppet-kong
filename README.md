kong
====

This puppet module installs and configures [Kong](https://getkong.org/).

It currently does not manage the service as init scripts are not provided.

Mashape does not currently supply yum or apt repositores, so relevant package
for the target platform s downloaded with wget and installed with rpm or dpkg.
For this reason, this module cannot manage package update easily as the dpkg
provider does not support the *'versionable'* feature.

**IMPORTANT:** This is a work in progress and has only been tested on CentOS 6 and Ubuntu Trusty (14.04), but should work on Debian. I will be testing with CentOS 5 and 7, other Ubuntu LTS releases and Debian at some point.

## TODO

- Create init scripts for Ubuntu/Debian and CentOS/RHEL so we can manage the service
- Improve installation/upgrades
- Add more parameters for kong.yml
