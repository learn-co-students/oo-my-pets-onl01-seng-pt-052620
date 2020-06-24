class Owner
  

  attr_reader :name, :owner

  @@all = []
  #@@pets = {:cats => [], :dogs => []}
  

  def initialize (name)

    @name = name
    @@all << self
    

  end


  def species

    @species = "human"

  end

  def say_species

     "I am a #{species}."

  end

  def self.all

    @@all 

  end

  def self.count

    count = 0

    @@all.each do |owners|
      count += 1
    end

    count

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

  def buy_cat(name)

     Cat.new(name, self)

  end

  def buy_dog(name)

    Dog.new(name, self)
    

  end

  def walk_dogs

    dogs.each do |dog|
      dog.mood = "happy"
    end
    

  end

  def feed_cats

    cats.each do |cat|
      cat.mood = "happy"
    end


  end

  def sell_pets
   
    #puts @@pets
    
    #@@pets[:dogs] << Dog.new(name, self)

    #@@pets.each do |pet, attribute|
    #  attribute.map do |pet|
     #    puts pet.name
      #end
    #end
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  

  end

  def list_pets

    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."

  end



end