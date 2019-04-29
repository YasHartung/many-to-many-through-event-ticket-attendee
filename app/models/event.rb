class Event

attr_accessor :name, :total_cost, :venue, :ticket_cost
@@all = []
  def initialize(name, total_cost, ticket_cost, venue)
    @name = name
    @total_cost = total_cost
    @ticket_cost = ticket_cost
    @venue = venue
    @@all << self
   end

  def self.all
    @@all
  end

  def sales_to_break_even
    sales = self.my_tickets.length * ticket_cost
    if total_cost.to_f - sales >0
      return ((total_cost.to_f - sales) / ticket_cost).ceil
    else
      return 0
    end
  end

  def my_tickets
    Ticket.all.select do |ticket|
      ticket.event == self
    end
  end

  def attendees
    self.my_tickets.map do |ticket|
      ticket.attendee

    end
  end

  def average_age
    age_arr = self.my_tickets.map do |ticket|
      ticket.attendee.age
    end
    age_arr.reduce(:+).to_f / age_arr.length
  end



end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0.
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
