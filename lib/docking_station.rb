# in lib/docking_sation.rb
require './lib/bike.rb'
require './lib/van.rb'
require './lib/garage.rb'
require './lib/bike_container.rb'

class DockingStation

  include BikeContainer

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise('Error: no bikes available at this docking station.') if empty?
    working_bikes.pop
  end

  def dock(bike)
    raise('Error: this docking station is occupied.') if full?
    bike.broken? ? broken_bikes << bike : working_bikes << bike
  end

  def bikes
    working_bikes + broken_bikes
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    working_bikes.empty?
  end

end
