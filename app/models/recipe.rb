class Recipe < ApplicationRecord
  def ingredients_list
    array = ingredients.split(", ")
    new_array = []
    array.each do |ingredient|
      if ingredient.ends_with?(".")
        new_array << ingredient.upcase.chomp(".")
      else
        new_array << ingredient.upcase
      end
    end
    return new_array
  end

  def directions_list
    return directions.split(", ").map { |direction| direction.capitalize }
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hours " if hours > 0
    result += "#{minutes} minutes" if minutes > 0
    result
  end
end
