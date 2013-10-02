# == Class: augeas
#
#  A puppet module that installs the latest version of Augeas
#
# === Parameters
#
# [*devel*]
#   Install the devel package
#
# === Example
#
#  Class['augeas']
#
# === Authors
#
#  Yanis Guenane  <yguenane@gmail.com>
#
# === Copyright
#
# Copyright 2013 Yanis Guenane
#
class augeas (
  $devel = false,
  ) {

  $ver = $::operatingsystemmajrelease
  $arch = $::architecture

  if $devel {
    $packages = ['augeas', 'augeas-libs', 'augeas-devel']
  }
  else {
    $packages = ['augeas', 'augeas-libs']
  }

  if $::osfamily == 'RedHat' {

    yumrepo {'augeas-yanisguenane':
      baseurl         => "http://yum.augeas.yanisguenane.fr/el/${::ver}/${::arch}/",
      failovermethod  => 'priority',
      enabled         => '1',
      gpgcheck        => '0',
      descr           => 'Last version of Augeas based on GitHub repository',
    } ->
    package {$packages:
      ensure => installed,
    }

  }
  else {
    fail('Your Operating System is not supported')
  }

}
