# Boris Bikes
London's Boris Bikes wanted to create transport for London, a new bike system that has a network of docking stations and bikes that anyone can use.

## User Stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working.

As a member of the public,
So I can return bikes I've hired,
I want to dock my bike at the docking station.

As a member of the public,
So I can decide whether to use the docking station,
I want to see a bike that has been docked.

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby

## Features

You'll be able to:

- Create new bike
- Create new dockingstation
- Create new van
- Create new garage
- Use a bike
- Dock a bike
- Check if a bike works
- Report a broken bike
- Collect bikes from docking station
- Deliver bikes to garage
- Repair a bike
- Collect bikes from garge station
- Deliver bikes to dockingstation
- You'll be given an error:
  - If you try to take/collect a bike when the dockingstation is empty
  - If you try to take a bike that isn't working from dockingstation
  - If you try to dock a bike dock/deliver when the dockingstation is full
  - If you try to take a bike when the van is empty
  - If you try to dock a deliver land when the van is full
  - If you try to take a bike when the garage is empty
  - If you try to dock a deliver land when the garage is full

## Getting Started

This programme is used in the terminal.

### Local Setup

```sh
$ git clone https://github.com/kealanheena/boris-bikes.git
```

```sh
$ cd boris-bikes
```

#### To Start

- Run "ruby  boris-bikes.rb" file in terminal.

## Running the tests

You can run tests by running "rspec" in boris-bikes file.

## Tests 

### Bike Class

- #working?
  - responds to 'working?' method
  - should be working when initialized
- #broken?
  - responds to 'broken?' method
  - should not be broken when initialized
- #report
  - can be reported as broken

### Docking Station Class

- #release_bike
  - responds to 'release_bike' method
  - returns the bike
  - doesn't realease a broken bike
  - gives an error message if there is no biked docked
  - releases working bikes
- #dock
  - stores Bike instances in an instance of DockingStation
  - should be able to dock the default capacity of 20 bikes
  - should dock a bike in the DockingStation
  - throws an error if capacity is full
  - throws an error if capacity is full when initialized with a capacity of 19
  - throws an error if capacity is full when initialized with a capacity of 21
  - should allow broken bikes to be docked

 ### Van Class

- #station_collection
  - should only collect the broken bikes from a docking station
  - should throw an error when the docking station is empty
  - should throw an error if it tries to collect at bike while at full capacity
  - should throw an error if it tries to collect at bike while at full capacity
  - should throw an error if it tries to collect at bike while at full capacity
- #garage_collection
  - should only collect the working bikes from a garage
  - should throw an error if the garage is empty
  - should not collect bikes if the van is full
- #station_delivery
  - should deliver the working bikes to the docking station
  - should raise an error if the van is empty
  - should raise an error if the docking station is full is empty
- #garage_delivery
  - should deliver the broken bikes to the garage
  - should not deliver bikes when the garage is full
  - should raise an error if the van is empty


### Garage Class

- #repair
  - should repair the broken bike
  - should raise an error if the bike isn't broken
  - should raise error if the bike isn\'t in the garage

### Bike Container Module

- #initialized
 - should be initialized with no bikes
 - capacity should equal 25 when 25 is passed as an argument
 - capacity should equal 20 when no argument is passed
- Docking Station
  - it behaves like a bike container
- Van
  - it behaves like a bike container
- Garage
  - it behaves like a bike container

## Versioning

"boris-bikes" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.

