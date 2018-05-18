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

  # pry(#<Owner>)> self.pets
  # => {:fishes=>
  #   [#<Fish:0x00000002b38df8 @mood="nervous", @name="Bubbles">,
  #    #<Fish:0x00000002b38d80 @mood="nervous", @name="Nemo">],
  #  :cats=>[#<Cat:0x00000002b38d08 @mood="nervous", @name="Crookshanks">],
  #  :dogs=>
  #   [#<Dog:0x00000002b38c90 @mood="nervous", @name="Fido">,
  #    #<Dog:0x00000002b38c18 @mood="nervous", @name="Snuffles">,
  #    #<Dog:0x00000002b38ba0 @mood="nervous", @name="Charley">]}

  def list_pets
    self.pets.each do |pet_type, pets|
      if pet_type == :fishes
        @fish_number = pets.size
      elsif pet_type == :cats
        @cats_number = pets.size
      elsif pet_type == :dogs
        @dogs_number = pets.size
      end
    end
    "I have #{@fish_number} fish, #{@dogs_number} dog(s), and #{@cats_number} cat(s)."
  end

  # * When an owner buys a new pet, the `buy_``cat/dog/fish` method takes in an argument of a *name*. You must take that name and do the following:
  #   * *Make a new instance of the appropriate pet, initializing it with that name*.
  #   * Associate that new pet instance to the owner by adding it to the appropriate array-value of the `@pets` hash stored in the `pets` `attr_accessor`.
  # * When an owner plays with a cat or feeds a fish or walks a dog, that pet will get happier. Remember that the `pets` method stores all of an owners pets.
  # The `@pets` hash stored in that method is full of *instances of the `Cat`/`Dog`/`Fish` class*.
  # That means you can call `Cat`/`Dog`/`Fish` instance methods (such as `.mood=`) on those pets.

end
