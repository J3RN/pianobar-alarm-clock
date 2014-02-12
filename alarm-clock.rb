# Required for Time.parse
require 'time'

puts "When would you like to wake up?"
in_up_time = gets

# Parse user input time and current time
up_time = Time.parse(in_up_time)

# Nofity user
puts "I will wake you up at #{ up_time.strftime("%H:%M") }"

# Continuously check for starting the music
while true
  # Grab the current time, compare it to the wake up time
  curr_time = Time.now
  if curr_time.hour == up_time.hour and curr_time.min == up_time.min
    puts "Wake up!"
    %x(pianobar)
  else
    sleep 60.0
  end
end
