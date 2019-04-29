class Attendee
attr_accessor :name, :age

@@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def events
    Ticket.all.select do |ticket|
      ticket.attendee == self
    end
  end

  def money_spent
    self.events.map do |ticket|
      ticket.event.ticket_cost
    end.reduce(:+)
  end


end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
