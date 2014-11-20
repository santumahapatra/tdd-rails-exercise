class Tickets < ActiveRecord::Base
  def self.search(params)
    tickets = "SELECT ticket_id FROM tickets"
  end
end
