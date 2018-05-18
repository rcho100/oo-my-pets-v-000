class Owner
  attr_accessor :pets
  @@all = []


  def initialize(name)
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
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
