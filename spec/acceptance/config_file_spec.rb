require 'spec_helper_acceptance'
require_relative './globals'

describe 'git::config_file' do

  context 'name and email' do
    it 'should contain passed variables' do
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

    describe file($user_config_file) do
      it { is_expected.to be_file }
      it { is_expected.to contain($user_name) }
      it { is_expected.to contain($user_email) }
    end
  end

end
