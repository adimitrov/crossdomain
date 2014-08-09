require 'spec_helper'
require 'crossdomain'

describe 'Crossdomain::XML' do
  describe "#validate!" do
    it 'should output schema errors as warnings' do
      expect(Crossdomain.logger).to receive(:warning).with(an_instance_of(String)).at_least(:once)
      expect(Crossdomain::XML.validate!('spec/files/invalid_spec.xml')).to eq(File.read('spec/files/invalid_spec.xml'))
    end

    it 'should return string for valid xml' do
      expect(Crossdomain::XML.validate!('spec/files/valid.xml')).to eq(File.read('spec/files/valid.xml'))
    end

    it 'should return false for invalid xml' do
      expect(Crossdomain::XML.validate!('spec/files/invalid.xml')).to eq(false)
    end

    it 'should throw error for missing file' do
      expect {
        Crossdomain::XML.validate!('spec/files/missing.xml')
      }.to raise_error
    end
  end
end
