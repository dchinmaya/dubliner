require_relative '../spec_helper'

describe Helper do
  before(:each) do
    @dummy = Class.new
    @dummy.extend(Helper)
  end

  context 'fileRead' do
    it 'returns a valid filehandle for a valid file' do
      expect(@dummy.fileRead(File.dirname(__FILE__) + '/../files/empty.txt')).to be_a(File)
    end

    it 'raises exception for non existing file' do
      expect{@dummy.fileRead(File.dirname(__FILE__) + '/i_do_not_exist')}.to raise_error(ArgumentError)
    end
  end

  context 'jsonParse' do
    it 'parses valid json as expected' do
      class Customer
        def ==(obj)
          self.latitude == obj.latitude &&
              self.longitude == obj.longitude &&
              self.user_id == obj.user_id &&
              self.name == obj.name
        end
      end
      testObj = Customer.new("26","Stephen McArdle","53.038056","-7.653889")
      expect(@dummy.jsonParse(File.new(File.dirname(__FILE__) + '/../files/single_customer.txt')).first).to eq(testObj)
    end

    it 'raises ecception for malformed json' do
      expect{@dummy.jsonParse(File.new(File.dirname(__FILE__) + '/../files/bad_bad_json.txt'))}.to raise_error(RuntimeError)
    end
  end

  context 'distanceCalculator' do
    it 'provides the right distance for valid inputs' do
      expect(@dummy.distanceCalculator(24.5 * Math::PI/180, -7.5 * Math::PI/180, 25 * Math::PI/180,
                                       -7 * Math::PI/180)).to eq(75.10216259555153)
    end

    it 'returns valid zero output for nil inputs' do
      expect(@dummy.distanceCalculator(nil,0.123, nil, -0.456)).to eq(0)
    end
  end
end
