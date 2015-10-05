require "./lib/drivinghistory.rb"
require "test/unit"

# This class tests functionality of the DrivingHistory class
# and it's methods
class TestDrivingHistory < Test::Unit::TestCase

  # Tests the DrvingHistory initialize function
  #
  # * *Tasks*    :
  #   - Create a new DrivingHistory object
  # * *Assert*    :
  #   - The object contains an empty Driver array
  #
  def test_init
    history = DrivingHistory.new()
    assert_not_nil(history.drivers)
  end

  # Tests the DrvingHistory parse_command function
  #
  # * *Tasks*    :
  #   - Create a new DrivingHistory object
  #   - Add a new Driver via parse_command
  #   - Add multiple Trip to the driver via parse_command
  # * *Assert*    :
  #   - The object contains a Driver named "Alex"
  #   - The Driver contains the first Trip
  #   - The Driver contains the second Trip
  #
  def test_parse_command
    history = DrivingHistory.new()
    history.parse_command("Driver Alex")
    history.parse_command("Trip Alex 12:01 13:16 42.0")
    history.parse_command("Trip Alex 14:05 15:16 62.4")
    assert_equal(history.drivers[0].name, "Alex")
    assert_equal(history.drivers[0].trips[0].miles_driven, 42.0)
    assert_equal(history.drivers[0].trips[1].miles_driven, 62.4)
  end

  # Tests the DrvingHistory sort_drivers function
  #
  # * *Tasks*    :
  #   - Create a new DrivingHistory object
  #   - Create 2 new Driver, "Alex" and "Greg"
  #   - Create 2 Trip, one for each new Driver with different miles_driven such that the second driver has driven more miles than the first
  #   - Call sort_drivers
  # * *Assert*    :
  #   - The drivers have been re-ordered such that the Driver who
  # has driven the most amount of miles now appears first in the list
  #
  def test_sort_drivers
    history = DrivingHistory.new()
    history.drivers << Driver.new("Alex")
    history.drivers << Driver.new("Greg")
    history.drivers[0].
      trips << Trip.new("Alex", "12:35", "13:35", "53.4")
    history.drivers[1].
      trips << Trip.new("Greg", "12:35", "13:35", "83.4")
    history.sort_drivers
    assert_equal(history.drivers[0].name, "Greg")
  end

  # Tests the DrvingHistory discard_trip_outliers function
  #
  # * *Tasks*    :
  #   - Create a new DrivingHistory object
  #   - Create a new Driver
  #   - Create 3 new Trip, two of which fall outside the outlier boundary designated to be < 5 mph and > 100 mph
  #   - Call discard_trip_outliers
  # * *Assert*    :
  #   - Only one Trip remains
  #   - The remaining Trip lies within the outlier boundaries
  #
  def test_discard_trip_outliers
    history = DrivingHistory.new()
    history.drivers << Driver.new("Alex")
    history.drivers[0].
      trips << Trip.new("Alex", "12:35", "13:35", "3.4")
    history.drivers[0].
      trips << Trip.new("Alex", "13:35", "14:35", "68.3")
    history.drivers[0].
      trips << Trip.new("Alex", "14:35", "15:35", "105.2")
    history.discard_trip_outliers
    assert_equal(history.drivers[0].trips.length, 1)
    assert_equal(history.drivers[0].trips[0].avg_speed, 68.3)
  end

end
