require 'pry'
class Owner
  attr_reader :name, :species #you can only read this, can't set it, so it can't change

  @@all = []

  def initialize(name)
    @name = name #takes in name upon initialization and sets to @name variable
    @species = "human" #species is set to human
    @@all << self
  end

  def say_species #says species
    "I am a human."
  end

  def self.all #returns all instances of owners
    @@all
  end

  def self.count #returns number of owners in @@all
    @@all.count
  end

  def self.reset_all #resets the owners that have been created, @@all is empty
    @@all = []
  end

  def cats #returns collection of all cats belonging to the owner
    Cat.all.select {|cat| cat.owner == self} #iterates through ALL cats and selects only the owners
    #where self is the owner
  end

  def dogs #returns collection of all dogs belonging to the owner
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name) #buy an instance of the Cat class
    Cat.new(name, self) #initializes a new instance of Cat, where the cat's name = name and the owner is self
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs #walks the dogs, makes dogs' mood happy
    Dog.all.each {|dog| dog.mood = "happy" if dog.owner == self}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy" if cat.owner == self}
  end

  def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

    def list_pets
      number_dogs = self.dogs.count
      number_cats = self.cats.count
      "I have #{number_dogs} dog(s), and #{number_cats} cat(s)."
    end
  end



end
