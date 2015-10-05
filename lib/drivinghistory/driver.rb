##
# This class defines Driver objects within the DrivingHistory database
#
# Each Driver will typically reside among other drivers within an array
# belonging to a parent DrivingHistory object. Driver names are unique.
# A Driver may have several trips.
#
#
class Driver

  # The first name of the driver (e.g. "Alex")
  attr_reader :name

  # An array of Trips belonging to the Driver
  attr_reader :trips


  # Create a new Driver
  #
  # Note: All arguments must be passed as strings
  #
  # * *Args*    :
  #   - +name+ -> first name of the driver (e.g. "Alex")
  #
  def initialize(name)
    @name = name
    @trips = []
  end

  # Loops through all trips in the trips array and deletes those
  # with a calculated average speed of less than 5 mph or
  # greater than 100 mph
  def discard_trip_outliers
    @trips.delete_if do |trip|
      if trip.avg_speed < 5.0 || trip.avg_speed > 100.0
        true
      end
    end
  end

  # Calculate the total distance driven by the Driver
  #
  #
  # * *Returns* :
  #   - the sum of miles driven in all trips belonging
  #     to the Driver (e.g. 31, 96)
  #
  def miles_driven
    return @trips.map(&:miles_driven).inject(0, :+).round(0)
  end

  # Calculate the total time driven by the Driver
  #
  #
  # * *Returns* :
  #   - the sum of all times of all trips belonging
  #     to the Driver in minutes (e.g. 54, 186)
  #
  def time_driven
    return @trips.map(&:duration).inject(0, :+).round(0)
  end

  # Calculate the average speed of the Driver across all trips
  #
  #
  # * *Returns* :
  #   - the average speed of all trips in miles per hour (e.g. 42, 71)
  #
  def avg_speed
    return (miles_driven.to_f / (time_driven.to_f / 60)).round(0)
  end

  # Generates a summary of all trips for the Driver
  #
  #
  # * *Returns* :
  #   - a string representing the Driver report (e.g. "Alex: 54 miles @ 25 mph")
  #
  def report
    report_string = @name + ": " + miles_driven.to_s + " miles"
    if miles_driven > 0
      report_string += " @ " + avg_speed.to_s + " mph"
    end
    return report_string
  end

end
