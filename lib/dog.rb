class Dog
  attr_accessor :owner, :mood
  @@all = []

  def initialize(name, owner)
    @NAME = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def name
    @NAME
  end

  def owner
    @owner
  end

  def mood
    #if self.owner == nil mood = "nervous"
    @mood
  end

  def self.all
    @@all
  end
end
