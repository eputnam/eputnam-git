require 'spec_helper_acceptance'

describe 'git::config_file' do

  let(:filepath) { "/root/config" }
  let(:name) { "Eric Putnam" }
  let(:email) { "putnam.eric@gmail.com" }

  context 'name and email' do
    it 'should contain passed variables' do
      pp = <<-EOM
        class { 'git': }
        git::config_file { '#{filepath}':
          user_name  => "#{name}",
          user_email => "#{email}"
         }
      EOM

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/root/config') do
      it { is_expected.to be_file }
      it { is_expected.to contain("Eric") }
    end
  end
end
