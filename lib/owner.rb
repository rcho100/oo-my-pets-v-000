require "pry"
class Owner
  attr_accessor :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
    binding.pry
    @species
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

end
