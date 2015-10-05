require "./lib/drivinghistory/driver.rb"
require "./lib/drivinghistory/trip.rb"

##
# This class defines DrivingHistory objects
#
# Each DrivingHistory will typically have many Drivers, and each Driver
# may have many Trip
#
#
class DrivingHistory

  # An array used for managing a list of drivers. Each Driver is defined
  # by a unique name
  attr_reader :drivers

  # Create a new DrivingHistory database and initialize an empty Driver array
  def initialize
    @drivers = []
  end

  # Parse a single command. Commands will either define new drivers
  # or define new trips belonging to existing drivers.
  #
  # Note: A full command must be passed as a single string
  #
  # * *Args*    :
  #   - +cmd+ -> A full command string (e.g. "Driver Alex", "Trip Alex 11:05 13:52 108.4")
  #
  def parse_command(cmd)
    command = cmd.split(" ")
    if command[0] == "Driver"
      @drivers << Driver.new(command[1])
    elsif command[0] == "Trip"
      @drivers.find {|d| d.name == command[1]}.
      trips << Trip.new(command[1], command[2], command[3], command[4])
    end
  end

  # Re-order the list of drivers by the total number of miles driven
  # for each Driver from greatest to least.
  def sort_drivers
    @drivers.sort! {|x, y| y.miles_driven <=> x.miles_driven}
  end

  # For all drivers: Loops through all trips in the trips array and 
  # deletes those with a calculated average speed of less than 5 mph
  # or greater than 100 mph
  def discard_trip_outliers
    @drivers.each do |driver|
      driver.discard_trip_outliers
    end
  end

end

