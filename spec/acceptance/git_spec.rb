require 'spec_helper_acceptance'

describe 'git class' do

  before(:all) do
    prep = <<-EOM
      package { 'git':
        ensure => absent,
      }
    EOM

    expect(apply_manifest(prep).exit_code).to eq(0)
  end

  context 'manage package is false' do
    it 'should work with no errors' do
      pp = <<-EOM
        class { 'git':
          manage_package => false
        }
      EOM

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package('git') do
      it { is_expected.to_not be_installed }
    end
  end

  context 'manage package is true and ensure => present' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { 'git':
          manage_package => true,
          package_ensure => present,
          package_name   => 'git'
        }
      EOS

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package('git') do
      it { is_expected.to be_installed }
    end
  end

  context 'manage package is true and ensure => absent' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { 'git':
          manage_package => true,
          package_ensure => absent,
          package_name   => 'git'
        }
      EOS

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package('git') do
      it { is_expected.to_not be_installed }
    end
  end

end
