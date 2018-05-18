require "pry"
class Owner
  attr_accessor :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.size
  end

  def self.all
    @@all
  end

  def say_species
    self.species
  end
end
