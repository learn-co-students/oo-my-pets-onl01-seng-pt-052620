class Owner
    attr_reader :name, :species, :dogs, :cats 
    @@all = [] 
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self  
  end 

  def say_species 
    "I am a human."
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
    Cat.all.select do |cat|
    cat.owner == self 
    end 
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self  
    end 
  end

  def buy_cat(new_cat) 
    new_cat = Cat.new(new_cat, self)
    new_cat 
  end

  def buy_dog(new_dog)
    new_dog = Dog.new(new_dog, self)
    new_dog 
  end

  def walk_dogs
    Dog.all.map do |dog|
    dog.mood = "happy" 
    end 
  end

  def feed_cats
    Cat.all.map do |cat|
    cat.mood = "happy"
    end  
  end 

  def sell_pets
    Dog.all.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil  
      end 

      Cat.all.map do |cat|
        cat.mood = "nervous"
        cat.owner = nil 
        end 
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
  end 


 
end 