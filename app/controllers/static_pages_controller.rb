class StaticPagesController < ApplicationController

  def home
  end

  def search
    start_thread
    render "search"
  end

  def status
    if thread_sleeping?
      render 'search'
    else
      render 'results'
    end
  end

  def results
    end_thread
  end

  private
    def start_thread
      @@new_thread = Thread.new{ go_look_for_stuff }
    end

    def end_thread
      @@new_thread.join
    end

    def thread_sleeping?
      @@new_thread.status == "sleep"
    end

    def go_look_for_stuff
      sleep(10)
      puts "I am supposed to be doing search but I make people wait and output to console"
    end
end
