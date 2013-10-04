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
  $devel    = false,
  $enabled  = 1,
  ) {

  $ver = $::operatingsystemmajrelease
  $arch = $::architecture

  if $devel and $enabled == 1 {
    $packages = ['augeas', 'augeas-libs', 'augeas-devel']
  }
  elsif !$devel and $enabled == 1 {
    $packages = ['augeas', 'augeas-libs']
  }
  else {
    $packages = []
  }


  if $::osfamily == 'RedHat' {

    yumrepo {'augeas-yanisguenane':
      baseurl         => "http://yum.augeas.yanisguenane.fr/el/${ver}/${arch}/",
      failovermethod  => 'priority',
      enabled         => $enabled,
      gpgcheck        => '0',
      descr           => 'Last version of Augeas based on GitHub repository',
    } ->
    package {$packages:
      ensure  => installed,
    }


  }
  else {
    fail('Your Operating System is not supported')
  }

}
