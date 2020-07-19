require 'pry'

class Owner
  @@all = []
  @@all_cats = []
  @@all_dogs = []

  def initialize(name)
    @@NAME = name
    @@SPECIES = "human"
    @@all << self
  end

  def name
    @@NAME
  end

  def species
    @@SPECIES
  end

  def say_species
    "I am a #{@@SPECIES}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    cats = Cat.all.select {|cat| cat.owner == self}
    cats
  end

  def dogs
    dogs = Dog.all.select {|dog| dog.owner == self}
    dogs
  end

  def buy_cat(name)
    cat = Cat.new(name, @owner)
    cat.owner = self
    @@all_cats << self
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name, @owner)
    dog.owner = self
    @@all_dogs << self
    dog
  end

  def walk_dogs
    self.dogs.each do |dog| dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat| cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|cat| cat.mood = "nervous"}

    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|cat| cat.owner = nil}
    #self.dogs.each {|dog| dog.mood = "nervous", dog.owner = nil}
    #self.cats.each {|cat| cat.mood = "nervous", cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
