require 'pry'
class Venue

@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def events
    Event.all.select do |event|
      event.venue == self
    end
  end

  def revenue
    binding.pry

    self.events.map do |event|
      if event.sales_to_break_even == 0
         ((event.my_tickets.length * event.ticket_cost) - event.total_cost)
      else
         0
      end
    end.reduce(:+)

  end

  def attendees
   tickets_at_venue =  Ticket.all.select do |ticket|
      self.events.include?(ticket.event)
    end.map do |ticket_venue|
      ticket_venue.attendee
    end.uniq


  end

end
