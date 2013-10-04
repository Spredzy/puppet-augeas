puppet-augeas [![Build Status](https://travis-ci.org/Spredzy/puppet-augeas.png)](https://travis-ci.org/Spredzy/puppet-augeas)

=============

A Puppet module that installs augeas latest GitHub version, from the YUM repository (yum.augeas.yanisguenane.fr)[http://yum.augeas.yanisguenane.fr]

# Parameters

* devel (boolean)

Indicate if augeas-devel package should be installed (default: false)

* enabled (0|1)

Indicate if the `augeas-yaniguenane` repo should be enabled (default: 1)

# Usage

    Class['augeas']

or

    class {'augeas' :
      devel => true,
    }

or

    class {'augeas' :
      enabled => 0,
    }

# Compatibility

This version works only on EL6 OS and x86_64 architecture. At the moment of this writing those are the only rpm generated.
