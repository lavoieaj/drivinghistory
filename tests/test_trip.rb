require "./lib/drivinghistory/trip.rb"
require "test/unit"
require "time"

# This class tests functionality of the Trip class
# and it's methods
class TestTrip < Test::Unit::TestCase

  # Defines precursor setup for all other Trip tests
  # * *Tasks*    :
  #   - Create a new Trip, "Alex 12:35 13:36 75.4"
  def setup
    @trip = Trip.new("Alex", "12:35", "13:36", "75.4")
  end

  # Post-test method, not required
  def teardown
    # empty
  end

  # Tests the Trip initialize function
  #
  # * *Assert*    :
  #   - The Trip driver is "Alex"
  #   - The Trip start_time is 12:35
  #   - The Trip end_time is 13:36
  #   - The Trip miles_driven is 75.4
  #
  def test_init
    assert_equal(@trip.driver, "Alex")
    assert_equal(@trip.start_time.strftime("%H:%M"), "12:35")
    assert_equal(@trip.stop_time.strftime("%H:%M"), "13:36")
    assert_equal(@trip.miles_driven, 75.4)
  end

  # Tests the Trip duration function
  #
  # * *Assert*    :
  #   - The Trip duration is 61.0 minutes
  #
  def test_duration
    assert_equal(@trip.duration, 61.0)
  end

  # Tests the Trip avg_speed function
  #
  # * *Assert*    :
  #   - The Trip avg_speed is 74.2 mph
  #
  def test_avg_speed
    assert_equal(@trip.avg_speed, 74.2)
  end

end
