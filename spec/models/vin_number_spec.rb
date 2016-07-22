require 'spec_helper'

describe VinNumber do
  it 'can be created' do
    vin_number = create :vin_number
    expect(vin_number).to_not be_nil
  end
end
