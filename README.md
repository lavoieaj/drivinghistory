# Driving History

This application is designed to solve the problem given at https://gist.github.com/dan-manges/1e1854d0704cb9132b74

The application uses inputs to build a driving history database containing drivers and their respective trips
and then outputs a report containing aggregate data of all drivers.

The full problem statement is specified at the bottom of this page

### Assumptions

The following are assumptions that may or may not be explicitly specified within the problem statement

1. All input is clean and free of typing errors
2. New drivers will always be specified before their respective trips
3. A driver will be declared only one time, all names are unique
4. All trip stop_times are greater than start_times
5. All trip miles_driven values are positive
6. A trip must be associated with a previously defined driver


### Running this Application

This application was written and tested using Ruby version 2.2.2p95

To run this application, pipe input via stdin using the command format below while residing in the /drivinghistory/ directory.

```
cat input.txt | ruby bin/app.rb
```


### Running Application Tests

While inside the top-level /drivinghistory/ directory, run the following command

```
rake test
```

### TODO

The following items would be next-steps for future development on this application, time permitting

1. Clean up rdoc, make it look pretty and improve navigation
2. Clean up gemspec
3. Add error detection/handling for bad input
4. Add negative-test cases

### Problem Statement

We're going to write some code to track driving history for people.

The code will process an input file. You can either choose to accept the input via stdin (e.g. `cat input.txt | ruby yourcode.rb`), or as a file name given on the command line (e.g. `ruby yourcode.rb input.txt`).

Each line in the input file will start with a command. There are two possible commands.

The first command is Driver, which will register a new Driver in the app. Example:

```
Driver Dan
```

The second command is Trip, which will record a trip attributed to a driver. The line will be space delimited with the following fields: the command (Trip), driver name, start time, stop time, miles driven. Times will be given in the format of hours:minutes. We'll use a 24-hour clock and will assume that drivers never drive past midnight (the start time will always be before the end time). Example:

```
Trip Dan 07:15 07:45 17.3
```

Discard any trips that average a speed of less than 5 mph or greater than 100 mph.

Generate a report containing each driver with total miles driven and average speed. Sort the output by most miles driven to least. Round miles and miles per hour to the nearest integer.

Example input:

```
Driver Dan
Driver Alex
Driver Ilya
Trip Dan 07:15 07:45 17.3
Trip Dan 06:12 06:32 12.9
Trip Alex 12:01 13:16 42.0
```

Expected output:

```
Alex: 42 miles @ 34 mph
Dan: 30 miles @ 36 mph
Ilya: 0 miles
```


