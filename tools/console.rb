require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:
msg = Venue.new("Madison Square Garden")
boa = Venue.new("Bank of America")


lucy = Attendee.new("Lucy", 22)
matt = Attendee.new("Matt", 26)
kelsey = Attendee.new("Kelsey", 28)


metal = Event.new("Metal", 100000, 50, boa)
beatles = Event.new("The Beatles", 1000000, 150, msg)
rock = Event.new("Rock",1000, 1000, boa)

lucy_metal= Ticket.new(metal, lucy)
matt_beatles = Ticket.new(beatles, matt)
kelsey_beatles = Ticket.new(beatles, kelsey)
lucy_beatles = Ticket.new(beatles, lucy)
lucy_rock = Ticket.new(rock, lucy)
kelsey_rock = Ticket.new(rock, kelsey)

#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
