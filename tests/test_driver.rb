require "./lib/drivinghistory/driver.rb"
require "test/unit"

# This class tests functionality of the Driver class
# and it's methods
class TestDriver < Test::Unit::TestCase

  # Defines precursor setup for all other Driver tests
  # * *Tasks*    :
  #   - Create a new Driver, named "Alex"
  #   - Create 2 new Trip associated with the Driver
  def setup
    @alex = Driver.new("Alex")
    @alex.trips << Trip.new("Alex", "12:35", "13:35", "53.4")
    @alex.trips << Trip.new("Alex", "13:35", "14:35", "68.3")
  end

  # Post-test method, not required
  def teardown
    # empty
  end

  # Tests the Driver initialize function
  #
  # * *Assert*    :
  #   - The Driver created during setup is named "Alex"
  #
  def test_init
    assert_equal(@alex.name, "Alex")
  end

  # Tests the Driver test_driver_trips function
  #
  # * *Tasks*    :
  #   - Create a new Driver object, named Alex
  #   - Create 2 new Trip objects for the Driver
  # * *Assert*    :
  #   - The Driver has 2 trips with the proper names
  #
  def test_driver_trips
    alex = Driver.new("Alex")
    alex.trips << Trip.new("Alex", "12:35", "13:36", "75.1")
    alex.trips << Trip.new("Alex", "08:01", "08:32", "31.4")
    assert_equal(alex.trips[0].driver, "Alex")
    assert_equal(alex.trips[1].driver, "Alex")
  end

  # Tests the Driver discard_trip_outliers function
  #
  # * *Tasks*    :
  #   - Create a new Driver, named "Alex"
  #   - Create 3 new Trip, two of which fall outside the outlier boundary designated to be < 5 mph and > 100 mph and add them to the Driver
  #   - Call discard_trip_outliers
  # * *Assert*    :
  #   - Only one Trip remains
  #   - The remaining Trip lies within the outlier boundaries
  #
  def test_discard_trip_outliers
    alex = Driver.new("Alex")
    alex.trips << Trip.new("Alex", "12:35", "13:35", "3.4")
    alex.trips << Trip.new("Alex", "13:35", "14:35", "68.3")
    alex.trips << Trip.new("Alex", "14:35", "15:35", "105.2")
    alex.discard_trip_outliers
    assert_equal(alex.trips.length, 1)
    assert_equal(alex.trips[0].avg_speed, 68.3)
  end

  # Tests the Driver miles_driven function
  #
  # * *Assert*    :
  #   - The Driver created during setup has driven 122 miles
  #
  def test_miles_driven
    assert_equal(@alex.miles_driven, 122)
  end

  # Tests the Driver time_driven function
  #
  # * *Assert*    :
  #   - The Driver created during setup has driven for 120 minutes
  #
  def test_time_driven
    assert_equal(@alex.time_driven, 120)
  end

  # Tests the Driver avg_speed function
  #
  # * *Assert*    :
  #   - The Driver created during setup has an average speed of 61 mph
  #
  def test_avg_speed
    assert_equal(@alex.avg_speed, 61)
  end

  # Tests the Driver report function
  #
  # * *Assert*    :
  #   - The Driver created during setup generates a report string that looks like "Alex: 122 miles @ 61 mph"
  #
  def test_report
    assert_equal(@alex.report, "Alex: 122 miles @ 61 mph")
  end

end
