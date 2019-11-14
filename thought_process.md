# User Story
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
#### => if broken => return "sorry this bike is broken"

# Domain Model

### Broken bike => In Use Bike => Functional Bike => Docked Bike => Bike
### Stocked Empty DockingStation => Empty DockingStation => DockingStation

# Errors

- uninitialized constant
- docking_station.rb
- line 1
- Uninitialized Constant is a NameError that refers to a class or module
- we could create a new class for "DockingStation"

# User Story pt 2

Objects  | Messages
------------- | -------------
User  |
Docking Station  | dock

Objects  | Messages
------------- | -------------
User  |
Bike | check_if_docked