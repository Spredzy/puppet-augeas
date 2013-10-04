require 'spec_helper'

describe 'augeas' do

  context 'RHEL6 Based Distros - Devel' do

      let(:facts) do
        {'osfamily' => 'RedHat',
         'architecture' => 'x86_64',
         'operatingsystemmajrelease' => '6',}
      end

      let(:params) do
        {'devel'    => true,
         'enabled'  => '1',}
      end

      it 'install Augeas - yanisguenane repo ' do
        should contain_yumrepo('augeas-yanisguenane').with({
          'baseurl'         => 'http://yum.augeas.yanisguenane.fr/el/6/x86_64/',
          'failovermethod'  => 'priority',
          'enabled'         => '1',
          'gpgcheck'        => '0',
          'descr'           => 'Last version of Augeas based on GitHub repository',
        })
      end

      it 'install augeas package' do
        should contain_package('augeas').with({
          'ensure'  => 'installed',
        })
      end

      it 'install augeas-libs package' do
        should contain_package('augeas-libs').with({
          'ensure'  => 'installed',
        })
      end

      it 'install augeas-devel package' do
        should contain_package('augeas-devel').with({
          'ensure'  => 'installed',
        })
      end

  end

  context 'RHEL6 Based Distros - Not Devel' do

      let(:facts) do
        {'osfamily' => 'RedHat',
         'architecture' => 'x86_64',
         'operatingsystemmajrelease' => '6',}
      end

      let(:params) do
        {'devel'    => false,
         'enabled'  => '1', }
      end

      it 'install Augeas - yanisguenane repo ' do
        should contain_yumrepo('augeas-yanisguenane').with({
          'baseurl'         => 'http://yum.augeas.yanisguenane.fr/el/6/x86_64/',
          'failovermethod'  => 'priority',
          'enabled'         => '1',
          'gpgcheck'        => '0',
          'descr'           => 'Last version of Augeas based on GitHub repository',
        })
      end

      it 'install augeas package' do
        should contain_package('augeas').with({
          'ensure'  => 'installed',
        })
      end

      it 'install augeas-libs package' do
        should contain_package('augeas-libs').with({
          'ensure'  => 'installed',
        })
      end

      it 'DOES NOT install augeas-devel package' do
        should_not contain_package('augeas-devel').with({
          'ensure'  => 'installed',
        })
      end

  end

  context 'RHEL6 Based Distros - Augeas Repo Disabled' do

      let(:facts) do
        {'osfamily' => 'RedHat',
         'architecture' => 'x86_64',
         'operatingsystemmajrelease' => '6',}
      end

      let(:params) do
        {'devel'    => false,
         'enabled'  => '0', }
      end

      it 'install Augeas - yanisguenane repo ' do
        should contain_yumrepo('augeas-yanisguenane').with({
          'baseurl'         => 'http://yum.augeas.yanisguenane.fr/el/6/x86_64/',
          'failovermethod'  => 'priority',
          'enabled'         => '0',
          'gpgcheck'        => '0',
          'descr'           => 'Last version of Augeas based on GitHub repository',
        })
      end

      it 'DOEST NOT install augeas package' do
        should_not contain_package('augeas').with({
          'ensure'  => 'installed',
        })
      end

      it 'DOEST NOT install augeas-libs package' do
        should_not contain_package('augeas-libs').with({
          'ensure'  => 'installed',
        })
      end

      it 'DOES NOT install augeas-devel package' do
        should_not contain_package('augeas-devel').with({
          'ensure'  => 'installed',
        })
      end

  end

end
