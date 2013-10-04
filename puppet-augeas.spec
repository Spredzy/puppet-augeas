Name:           puppet-augeas
Version:        0.1.0
Release:        1%{?dist}
Summary:        A puppet module that installs a nightly build of augeas

Group:          System Environment/Libraries
License:        Apache v2
URL:            http://forge.puppetlabs.com/yguenane/augeas
Source0:        http://forge.puppetlabs.com/yguenane/augeas/%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Requires:       puppet

%description
A puppet module that installs a nightly build of the Augeas project based
on the GitHub sources.

%prep
%setup -n yguenane-augeas-%{version}

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/etc/puppet/modules/augeas/
cp -r * $RPM_BUILD_ROOT/etc/puppet/modules/augeas/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{_sysconfdir}/puppet/modules/*

%changelog
* Fri Oct 4 2013  Yanis Guenane  <yguenane@gmail.com>  0.1.0
- Initial version

