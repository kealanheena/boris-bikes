# Boris Bikes
London's Boris Bikes wanted to create transport for London, a new bike system that has a network of docking stations and bikes that anyone can use.

- noun = person
- verb = releasing

Objects  | Messages
------------- | -------------
Person  |
Bike  | releasing_bike

#### Person (uses bike) 
#### => if broken or in use => can't accesss bike
#### => if working and not in use => release bike

- noun = person
- verb = working

Objects  | Messages
------------- | -------------
Person  |
Good Bike  | check_if_working

#### Person (checks condition of bike) 
#### => if working => returns "working would you like to use"
#### => if broken => return "sory this bike is broken"

## Build Status

This project is currently a work in progress.

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

#### Intructions

- ?????

## Running the tests

You can run tests by running "rspec" in boris-bikes file.

### Tests 

- Check if bikes are usable
- Check if bike is broken(new bike are always working)
- Check if a docked is returned to bike rack
- To see if breaking a bike puts it with bikes needing repairs


## Versioning

"boris-bikes" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.

# This is a change
