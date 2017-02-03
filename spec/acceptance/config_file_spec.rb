require 'spec_helper_acceptance'
require_relative './globals'

describe 'git::config_file' do

  describe file($user_config_file) do
    it 'should apply without errors' do
      pp = <<-EOM
      class { 'git': }
      git::config_file { '#{$user_config_file}':
        user_name  => "#{$user_name}",
        user_email => "#{$user_email}"
        }
    EOM

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it { is_expected.to be_file }
    it { is_expected.to contain($user_name) }
    it { is_expected.to contain($user_email) }

  end

  describe file("/root/.alias_gitconfig") do
    it 'should apply without errors' do
      pp = <<-EOM
        class { 'git': }
        git::config_file { "/root/.alias_gitconfig":
          user_name  => "#{$user_name}",
          user_email => "#{$user_email}",
         }
      EOM

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it { is_expected.to be_file }
    it { is_expected.to_not contain('\[alias\]') }

  end

  describe file("/root/.alias_gitconfig2") do
    it 'should apply without errors' do
      pp = <<-EOM
        class { 'git': }
        git::config_file { "/root/.alias_gitconfig2":
          user_name  => "#{$user_name}",
          user_email => "#{$user_email}",
          aliases    => [{'a' => 'add'}],
        }
      EOM

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it { is_expected.to be_file }
    it { is_expected.to contain("a = 'add'") }

  end
end
