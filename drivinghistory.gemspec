#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name		= "drivinghistory"
  spec.version		= '1.0'
  spec.authors		= ["Alex Lavoie"]
  spec.email		= ["lavoieaj@miamioh.edu"]
  spec.summary		= %q{Reads driver & trip data and outputs driving summaries}
  spec.description	= %q{This program accepts input of driver & trip data via stdin.
                             This data is stored in objects and then a report is generated  
                             for each driver containing total miles driven and average speed, 
                             sorted by most miles driven to least.}
  spec.homepage		= "/"
  spec.license		= "MIT"

  spec.files		= ['lib/drivinghistory.rb','lib/drivinghistory/driver.rb','lib/drivinghistory/trip.rb']
  spec.executables	= ['bin/app.rb']
  spec.test_files	= ['tests/test_drivinghistory.rb','tests/test_driver.rb','test/test_trip.rb']
  spec.require_paths	= ["lib"]
end

