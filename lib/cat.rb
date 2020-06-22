class Cat
  
  @@all_cats = []
  attr_reader :name
  attr_accessor :mood, :owner
 
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all_cats << self
  end
  
  def self.all
    @@all_cats
  end
end