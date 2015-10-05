require "./lib/drivinghistory.rb"

##
# This module defines the primary point of entry for the DrivingHistory application
# Please refer to the rdoc or gemspec file for more information
#
# Author: Alex Lavoie (lavoieaj@miamioh.edu)
# Date: October 5, 2015
# License: MIT
#
module DrivingHistoryApp
  
  # Define a new DrivingHistory 'database'
  history = DrivingHistory.new()
  
  # Parse each command passed from 'cat input.txt |' to populate the DrivingHistory 'database' with Drivers and Trips
  ARGF.each_line do |e|
    history.parse_command(e)
  end

  # Remove all trips < 5 mph and > 100 mph
  history.discard_trip_outliers

  # Sort all drivers by miles driven, descending
  history.sort_drivers

  # print a report for each driver
  history.drivers.each do |driver|
    puts driver.report
  end

end
