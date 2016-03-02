

food_info = {fridges:
              {person:
                {grandma:["cauliflower", "sour cream", "couch candy"],
                flatiron_school: ["donuts", "coffee", "siracha"],
                steven:["beef", "ham"]}
              },
            restaurants: "McDonalds"
}

# puts food_info[:fridges][:person][:grandma]
#
# puts food_info.fridges.person.grandma


# class FoodFinder
#
#   def initialize(food_info)
#     @food_info = food_info
#   end
#
#   def fridges
#     @fridges = @food_info[:fridges]
#     self
#   end
#
#   def person
#     @person = @fridges[:person]
#     self
#   end
#
#   def grandma
#     @person[:grandma]
#   end
#
# end
#
# hungerz = FoodFinder.new(food_info)
#
# puts hungerz.fridges.person.grandma
require 'pry'
class FoodFinder


  def initialize(food_info)
    @food_info = food_info
  end


  def fridges
    binding.pry
    FoodFinder.new(@food_info[:fridges])
  end

  def person
    binding.pry
    FoodFinder.new(@food_info[:person])
  end

  def grandma
    binding.pry
    @food_info[:grandma]
  end

end
hungerz = FoodFinder.new(food_info)

puts hungerz.fridges.person.grandma
