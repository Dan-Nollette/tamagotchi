require ('rspec')
require ('pet')

describe(Pet) do
  describe('#initialize') do
    it("sets the name and life levels of a new tam") do
      my_pet = Pet.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end
  describe("#is_alive?") do
    it("is alive if the food level is above 0") do
      my_pet = Pet.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end
    it("is alive if the food level is 0") do
      my_pet = Pet.new("lil dragon")
      my_pet.food_level = 0
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end
  describe("#time_passes") do
    it("decreases the amount of food the tam has left by 1") do
      my_pet = Pet.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
    it("decreases the amount of sleep the tam has left by 1") do
      my_pet = Pet.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.sleep_level()).to(eq(9))
    end
  end
end
