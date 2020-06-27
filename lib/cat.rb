class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []
  

  def initialize(name, owner)
    @name = name
    #name = "Crookshanks"
    @owner = owner
    #"Hermione"
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def self
    self.all.include([0])
  end

end