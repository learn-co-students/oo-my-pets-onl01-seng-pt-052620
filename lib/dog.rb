class Dog
  @@all_dogs = []
  
  attr_reader :name
  attr_accessor :mood, :owner
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all_dogs << self
  end
  
  def self.all
    @@all_dogs
  end
end