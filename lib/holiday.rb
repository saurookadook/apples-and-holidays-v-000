require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << "#{supply}"
  holiday_hash[:winter][:new_years] << "#{supply}"
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << "#{supply}"
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  # binding.pry
  holiday_hash.each do |season_key, holiday_value|
    # binding.pry
    if season_key == :fall
      holiday_hash[season][holiday_name] = supply_array
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  collected_supplies = []
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday_name, supplies|
        collected_supplies << supplies.flatten
      end
    end
  end
  return collected_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season_key, holiday_value|
    puts "#{season_key.capitalize}:"
    holiday_value.each do |holiday_key, supplies_array|
      new_holiday_key = []
      new_supply_array = []
      holiday_key_array = holiday_key.to_s.split("_")
      holiday_key_array.each do |word|
        new_holiday_key << word.capitalize
      end
      supplies_array.each do |supply|
        supply_word_array = supply.split(" ")
        new_supply_word_array = []
        supply_word_array.each do |word|
          if !(word.upcase)
            new_supply_word_array << word.capitalize
          elsif word.upcase
            new_supply_word_array << word
          end
        end
        new_supply_array << new_supply_word_array.join(" ")
      end
      puts "  #{new_holiday_key.join(" ")}: #{new_supply_array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []
  holiday_hash.each do |season_key, holiday_value|
    holiday_value.each do |holiday_name, supplies|
      if supplies.include?("BBQ")
        bbq_array << holiday_name
      end
    end
  end
  bbq_array
end
