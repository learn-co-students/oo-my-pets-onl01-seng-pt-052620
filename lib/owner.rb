require "pry"
class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    count = 0
  end

  def say_species
    "I am a human."
  end
  
  def cats 
    Cat.all.select do |cat| #Associations Owner instance methods #cats returns a collection of all the cats that belong to the owner
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def self.all # .all returns all instances of Owner that have been created
    @@all
  end
  
  def self.count  #.count returns the number of owners that have been created
    @@all.count
  end

  def self.reset_all #.reset_all can reset the owners that have been created
    self.all.clear
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self) #can buy a cat that is an instance of the Cat class knows about its cats
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs 
    self.dogs.each do |dog|
    dog.mood = "happy"
    end
  end

  def feed_cats
  self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet| pet.mood = "nervous"
    pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
