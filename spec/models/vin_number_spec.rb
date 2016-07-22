require 'spec_helper'

describe VinNumber do

  it 'can be created' do
    vin_number = create :vin_number
    expect(vin_number).to_not be_nil
  end

  it 'needs tests to be written!' do
    pending('write tests for VinNumber!')
  end

end
