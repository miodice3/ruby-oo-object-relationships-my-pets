require 'pry'
class Owner
  # code goes here

  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
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

  def buy_cat(name)
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |class_instance|
      class_instance.mood = "happy"
    end
     #changes mood of dog to be type happy
  end

  def feed_cats
    Cat.all.each do |class_instance|
      class_instance.mood = "happy"
    end
      #changes mood of cat to be type happy
  end

  def sell_pets   #says sell all pets
    Cat.all.each do |class_instance|
      class_instance.owner = nil
      class_instance.mood = "nervous"
    end
    Dog.all.each do |class_instance|
      class_instance.owner = nil
      class_instance.mood = "nervous"
    end
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
    # owner_cats = []
    # Cat.all.each do |class_cat|
    #   #binding.pry
    #   if class_cat.owner.name == @name
    #     owner_cats << class_cat
    #   end
    # end
    # owner_cats
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def list_pets
#    binding.pry
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end

