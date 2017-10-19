require_relative '../spec_helper'

describe Customer do
  it 'raises exception with missing name' do
    expect { Customer.new(1, nil, 53.5, -7.5) }.to raise_error(RuntimeError)
  end

  it 'raises exception with missing user_id' do
    expect { Customer.new(nil, 'captain obvious', 53.5, -7.5) }.to raise_error(RuntimeError)
  end

  it 'raises exception with missing latitude' do
    expect { Customer.new(1, 'captain obvious', nil, -7.5) }.to raise_error(RuntimeError)
  end

  it 'raises exception with missing longitude' do
    expect { Customer.new(1, 'captain obvious', 53.5, nil) }.to raise_error(RuntimeError)
  end
end
