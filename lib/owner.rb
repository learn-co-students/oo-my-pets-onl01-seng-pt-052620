require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def say_species
    return "I am a #{@species}."
  end


  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat,self)
  end

  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs_array = dogs
    cats_array = cats
    # binding.pry
    dogs_array.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    cats_array.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end






end