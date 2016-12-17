require 'spec_helper'

describe 'git::config', :type => :class do
  context "On a Debian OS" do
    let :facts do
      {
        :osfamily      => 'Debian',
        :operatingsystemrelease => '7'
      }

      it { is_expected.to have_resource_count(0) }
    end
  end
end
