require 'pry'

class Owner
  @@all= []
  attr_accessor :dogs, :cats
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def buy_cat(name)
    name = Cat.new(name, self)
  end
  
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def buy_dog(name)
    name = Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def species
    @species
  end
  
  def cats
    my_cats = []
    Cat.all.each do |cat|
      if cat.owner == self
        my_cats << cat
      end
    end
    my_cats
  end
  
  def dogs
    my_dogs = []
    Dog.all.each do |dog|
      if dog.owner == self
        my_dogs << dog
      end
    end
    my_dogs
  end
  
  def sell_pets
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil 
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
end