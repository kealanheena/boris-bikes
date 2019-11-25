# Boris Bikes
London's Boris Bikes wanted to create transport for London, a new bike system that has a network of docking stations and bikes that anyone can use.

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby

## Features

You'll be able to:

- Create new bike
- Use a bike
- Break a bike
- Check if a bike works
- Dock a bike

## Getting Started

This programme is used in the terminal.

#### To Start

- Run "ruby  boris-bikes.rb" file in terminal.

## Running the tests

You can run tests by running "rspec" in boris-bikes file.

### Tests 

### Bike class

- Check if it responds to the 'working?' method

### Docking Station class

- Check if it responds to the 'release_bike' method
- Check if 'release_bike' returns an instace of a bike
- Check if a bike is working with 'working?' method
- Throwing an error if you try to release a bike from an empty docking station
- Check if after docking a vike the bike is in that docking station
- Checking the default capacity of the docking station
- Checking if the docking station is empty by default
- Throwing an error when theres not enough room for another bike
- Check if passing an argument changes the capacity

## Versioning

"boris-bikes" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.

