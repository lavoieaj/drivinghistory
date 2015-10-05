require "time"

##
# This class defines Trip objects within the DrivingHistory database
#
# Each Trip will typically belong to a Driver, and that Driver may
# have many trips.
#
#
class Trip

  # The first name of the driver, corresponding to the name saved
  # in the parent Driver object (e.g. "Alex")
  attr_reader :driver

  # The time that the trip started in HH:MM format (e.g. 08:51, 17:48)
  attr_reader :start_time

  # The time that the trip started in HH:MM format (e.g. 08:51, 17:48)
  attr_reader :stop_time

  # The distance driven during the trip in miles (e.g. 84.7)
  attr_reader :miles_driven


  # Create a new Trip
  #
  # Note: All arguments must be passed as strings
  #
  # * *Args*    :
  #   - +driver+ -> first name of the Driver (e.g. "Alex")
  #   - +start_time+ -> time the trip started in HH:MM format (e.g. "08:51", "17:48")
  #   - +stop_time+ -> time the trip ended in HH:MM format (e.g. "08:51", "17:48")
  #   - +miles_driven+ -> total number of miles driven during the Trip (e.g. "84.7")
  #
  def initialize(driver, start_time, stop_time, miles_driven)
    @driver = driver
    @start_time = Time.parse(start_time)
    @stop_time = Time.parse(stop_time)
    @miles_driven = miles_driven.to_f
  end

  # Calculate the duration of the trip in minutes
  #
  #
  # * *Returns* :
  #   - the duration of the trip in minutes (e.g. 31.8, 96.1)
  #
  def duration
    return (@stop_time - @start_time)/60.0
  end

  # Calculate the average speed of the trip in miles per hour
  #
  #
  # * *Returns* :
  #   - the average speed of the trip in miles per hour (e.g. 42.0, 71.4)
  #
  def avg_speed
    return (@miles_driven/(duration()/60.0)).round(1)
  end

end
