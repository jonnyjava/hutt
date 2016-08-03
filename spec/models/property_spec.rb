require 'spec_helper'

describe Property do

  it 'can be created' do
    property = create :property
    expect(property).to_not be_nil
  end

  it 'needs tests to be written!' do
    pending('write tests for Property!')
  end

end
