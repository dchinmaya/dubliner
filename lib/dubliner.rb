require_relative 'dubliner/helper'

class Dubliner
  include Helper
  def initialize(latitude, longitude)
    self.latitude = latitude
    self.longitude = longitude
  end

  def latitude=(l)
    raise ArgumentError.new("latitude #{l} is invalid") unless l
    @latitude = (l.to_f * Math::PI) / 180
  end

  def longitude=(l)
    raise ArgumentError.new("longitude #{l} is invalid") unless l
    @longitude = (l.to_f * Math::PI) / 180
  end

  def getInvitees(filename)
    file = fileRead(filename)
    customers = jsonParse(file)
    invitees = []
    longestName = 0
    customers.each do |c|
      distance = distanceCalculator(c.latitude, c.longitude, @latitude, @longitude)
      if distance < 100.0
        c.distance = distance
        invitees.push(c)
        longestName = c.name.length unless longestName >=c.name.length
      end
    end
    invitees.sort_by! {|i| i.user_id}
    printInvitees(invitees, longestName)
  end

  def printInvitees(invitees, width)
    printf "count  %-#{width}s %s    %s", 'invitees', 'user_id', 'distance(km)'
    puts ''
    puts '-------------------------------------------------------------------------'
    counter = 1
    invitees.each do |i|
      printf "%3d    %-#{width}s %3d        %-3.2f\n", counter, i.name, i.user_id, i.distance
      counter += 1
    end
    puts '-------------------------------------------------------------------------'
  end
  VERSION = '0.1.0'
end

