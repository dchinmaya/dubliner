require 'json'
require_relative 'customer'

module Helper

  # input : filename
  # output : a valid file handle for the filename
  def fileRead(filename)
    raise ArgumentError.new("File #{filename} does not exist") unless File.exist?(filename)
    raise ArgumentError.new("File #{filename} is not readable. Verify access permissions of the file") unless File
                                                                                                              .readable? (filename)
    File.new(filename)
  end

  # input : valid file handle
  # output : array of customer objects
  def jsonParse(f)
    customers = []
    malformed_line = ''
    begin
      f.each_line do |line|           # read line by line to avoid exhausting memory with large inputs
        malformed_line = line
        data = JSON.parse(line)
        c = Customer.new(data['user_id'], data['name'], data['latitude'], data['longitude'])
        customers.push(c)
      end
    rescue JSON::ParserError
      raise "Malformed JSON in file #{f.to_s}, line #{malformed_line}"
    end
    customers
  end

  # input : latitude, longitude of point 1 in rads, latitude, longitude of point 2 in rads
  # output : distance between the two points in kms
  def distanceCalculator(la1, lo1, la2, lo2)
    return 0 if la1 == nil || la2 == nil || lo1 == nil || lo2 == nil
    delLambda = (lo2-lo1).to_f
    numerator = Math.sqrt(((Math.cos(la2) * Math.sin(delLambda)) ** 2) +
                ((Math.cos(la1) * Math.sin(la2) - Math.sin(la1) * Math.cos(la2) * Math.cos(delLambda)) ** 2))
    denominator = Math.sin(la1) * Math.sin(la2) + Math.cos(la1) * Math.cos(la2) * Math.cos(delLambda)
    denominator = 0.0000000000000000000001 if denominator == 0.0
    delta = Math.atan(numerator/denominator)
    earthRadius * delta
  end

  # output : radius of earth in kms
  def earthRadius
    6371.0
  end
end
