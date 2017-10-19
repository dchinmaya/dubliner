require_relative 'spec_helper'

describe Dubliner do
  results = <<'EOF'
count  invitees          user_id    distance(km)
-------------------------------------------------------------------------
  1    Ian Kehoe           4        10.44
  2    Nora Dempsey        5        23.16
  3    Theresa Enright     6        23.95
  4    Eoin Ahearn         8        83.67
  5    Richard Finnegan   11        38.03
  6    Christina McArdle  12        41.68
  7    Olive Ahearn       13        62.06
  8    Michael Ahearn     15        43.56
  9    Patricia Cahill    17        96.24
 10    Eoin Gallagher     23        82.82
 11    Rose Enright       24        89.15
 12    Stephen McArdle    26        98.73
 13    Oliver Ahearn      29        72.21
 14    Nick Enright       30        82.63
 15    Alan Behan         31        44.13
 16    Lisa Ahearn        39        38.20
-------------------------------------------------------------------------
EOF

  empty_list = <<'EOF'
count  invitees user_id    distance(km)
-------------------------------------------------------------------------
-------------------------------------------------------------------------
EOF

  it 'has a version number' do
    expect(Dubliner::VERSION).not_to be nil
  end

  it 'raises exception if latitude is not provided' do
    expect { Dubliner.new(nil, nil) }.to raise_error(ArgumentError)
  end

  it 'works fine when input is fine' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/customers.txt') }.to output(results).to_stdout
  end

  it 'raises exception if input file is absent' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees('_i_do_not_exist') }.to raise_error(ArgumentError)
  end

  it 'raises exception with malformed json input' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/bad_bad_json.txt') }.to raise_error(RuntimeError)
  end

  it 'raises exception with valid json and missing name' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/no_name.txt') }.to raise_error(RuntimeError)
  end

  it 'raises exception with valid json and missing user_id' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/no_userid.txt') }.to raise_error(RuntimeError)
  end

  it 'raises exception with valid json and missing latitude' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/no_lat.txt') }.to raise_error(RuntimeError)
  end

  it 'raises exception with valid json and missing longitude' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/no_long.txt') }.to raise_error(RuntimeError)
  end

  it 'runs fine with empty file input' do
    d = Dubliner.new(53.3381985, -6.2592576)
    expect { d.getInvitees(File.dirname(__FILE__) + '/files/empty.txt') }.to output(empty_list).to_stdout
  end
end
