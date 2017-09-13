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
  describe("#pet_status") do
    it("returns strings to tell how your pet is doing") do
      my_pet = Pet.new("lil dragon")
      expect(my_pet.pet_status()).to(eq(["fed", "rested", "ready to roll"]))
    end
    it("returns strings to tell how your pet is doing") do
      my_pet = Pet.new("lil dragon")
      my_pet.food_level = 2
      my_pet.sleep_level = 2
      my_pet.activity_level = 2
      expect(my_pet.pet_status()).to(eq(["starving", "plum tuckered", "all worn out"]))
    end
    it("returns strings to tell how your pet is doing") do
      my_pet = Pet.new("lil dragon")
      my_pet.food_level = 5
      my_pet.sleep_level = 5
      my_pet.activity_level = 5
      expect(my_pet.pet_status()).to(eq(["hungry", "kinda sleepy", "a little winded"]))
    end
  end
  describe("#pet_status") do
    it("compares the current time to the last time it was updated and changes your pet accordingly") do
      my_pet = Pet.new("lil dragon")
      my_pet.last_update= (my_pet.last_update - Time.at(60))
      temp = my_pet.last_update
      my_pet.update_pet
      # expect(my_pet.food_level()).to(eq(6))
      expect((my_pet.last_update - temp) > 59)
    end
  end
end


# (time_right_now - stored_time / 60).times do
#   time_passes
# end
