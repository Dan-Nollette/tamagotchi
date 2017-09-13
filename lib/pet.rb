class Pet
  @@main_pet =[]
  attr_accessor(:name, :food_level, :sleep_level, :activity_level, :last_update, :main_pet)
  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @last_update = Time.new
  end
  def is_alive?
    @food_level > 0
  end
  def time_passes
    @food_level -= 1
    @sleep_level -= 1
  end
  def update_pet
    (((Time.new - @last_update).to_i)/5).times do
      time_passes
    end
    @last_update = Time.new
  end
  # def please_master
  # end
  def pet_status
    if @food_level >= 8
      food_string = "fed"
    elsif @food_level >= 4
      food_string = "hungry"
    else
      food_string = "starving"
    end

    if @sleep_level >= 8
      sleep_string = "rested"
    elsif @sleep_level >= 4
      sleep_string = "kinda sleepy"
    else
      sleep_string = "plum tuckered"
    end

    if @activity_level >= 8
      activity_string = "ready to roll"
    elsif @activity_level >= 4
      activity_string = "a little winded"
    else
      activity_string = "all worn out"
    end
    status_array = [food_string, sleep_string, activity_string]
  end

  def feed
    update_pet
    @food_level = 10
  end
  def sleep
    update_pet
    @sleep_level = 10
  end
end
