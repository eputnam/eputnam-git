require 'spec_helper'

describe 'git', :type => :class do
  context 'not managing the package' do

    let :params do
      {
        :manage_package => false,
      }
    end

    it { is_expected.to_not contain_package('git')}

  end
  context 'managing the package' do

    let :params do
      {
        :manage_package => true,
      }
    end

    it { is_expected.to contain_package('git')}

  end
end
