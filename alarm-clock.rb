# Required for Time.parse
require 'time'

puts "When would you like to wake up?"
in_up_time = gets

# Parse user input time and current time
up_time = Time.parse(in_up_time)

# Notify user
puts "I will wake you up at #{ up_time.strftime("%H:%M") }"

alarm_turned_off = false

# Continuously check for starting the music
while true
  # Grab the current time, compare it to the wake up time
  curr_time = Time.now
  if curr_time.hour == up_time.hour and curr_time.min == up_time.min
    if not alarm_turned_off
      puts "Wake up!"
      pid = spawn("pianobar")
      puts "Press any key to stop alarm..."
      gets
      Process.kill("SIGTERM", pid)
      puts "\nGood morning!"
      puts "I'll wake you up at #{ up_time.strftime("%H:%M") } tomorrow"
      alarm_turned_off = true
    end
  else
    if alarm_turned_off
      alarm_turned_off = false
    end
    sleep 30.0
  end
end
