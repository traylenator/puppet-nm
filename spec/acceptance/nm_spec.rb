# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'nm class' do
  context 'without any parameters' do
    include_examples 'the example', 'nm.pp'

    it_behaves_like 'an idempotent resource'

    describe package('NetworkManager') do
      it { is_expected.to be_installed }
    end

    describe service('NetworkManager') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
