class StaticPagesController < ApplicationController
  def home
  end

  def search
    new_thread = Thread.new{ go_look_for_stuff }
    new_thread.join
  end

  private
    def go_look_for_stuff
      puts Time.now
      sleep(3)
      puts Time.now
      puts "I am supposed to be doing search but I make people wait and output to console"
    end
end
