# require 'bundler'
# Bundler.require


# SMIC Net = (Minimum French salary for an hour once taxes are paid)
SMIC_HORAIRE_NET = 8.03

def ask_user_amount_of_money
  puts "\e[35mHow much money are you going to spend (in €) ?"
  print "\e[39m> "
  gets.to_f
end

# Convert a price in euros to a work time in seconds
def convert_price_in_work_time(amount)
  amount / SMIC_HORAIRE_NET * 60 * 60
end

def convert_work_time_in_hours(amount, work_in_seconds)
  work_in_hours = work_in_seconds / 60 / 60
  puts "\e[35mPaying #{amount} €, will cost you #{work_in_hours.ceil} hours of \
lifetime"
end

def seconds_to_units(seconds)
  puts "If you work 8 hours a day, this means : " \
  '%d working days, %d hours, %d minutes, %d seconds' %
      # the .reverse lets us put the larger units first for readability
      [8,60,60].reverse.inject([seconds]) {|result, unitsize|
        result[0,0] = result.shift.divmod(unitsize)
        result
      }
end

def perform
  # Ask users the amount of money he is about to spend
  amount = ask_user_amount_of_money

  # Convert price (in euros) into seconds of work
  work_time = convert_price_in_work_time(amount)
  puts ""

  # Display number of hours to work in order to gain such amount of money
  convert_work_time_in_hours(amount, work_time)

  # Convert xork in seconds into a datetime
  puts seconds_to_units(work_time)
end

perform
