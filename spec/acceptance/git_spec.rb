require 'spec_helper_acceptance'

describe 'git class' do

  context 'default parameters' do
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        class { 'git': }
      EOS

      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe command('which git') do
      its(:stdout) { should match /bin/ }
    end

  end
end
