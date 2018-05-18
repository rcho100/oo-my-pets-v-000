require "pry"
class Owner
  attr_accessor :pets, :name
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
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets_hash = self.pets
    pets_hash[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets_hash = self.pets
    pets_hash[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each {|pet_type, pet| pet.each {|pet| pet.mood = "nervous"}}
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def list_pets
    binding.pry
    self.pets
  end

  # * When an owner buys a new pet, the `buy_``cat/dog/fish` method takes in an argument of a *name*. You must take that name and do the following:
  #   * *Make a new instance of the appropriate pet, initializing it with that name*.
  #   * Associate that new pet instance to the owner by adding it to the appropriate array-value of the `@pets` hash stored in the `pets` `attr_accessor`.
  # * When an owner plays with a cat or feeds a fish or walks a dog, that pet will get happier. Remember that the `pets` method stores all of an owners pets.
  # The `@pets` hash stored in that method is full of *instances of the `Cat`/`Dog`/`Fish` class*.
  # That means you can call `Cat`/`Dog`/`Fish` instance methods (such as `.mood=`) on those pets.

end
