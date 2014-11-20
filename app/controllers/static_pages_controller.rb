class StaticPagesController < ApplicationController

  def home
  end

  def search
    start_thread(params)
    render "search"
  end

  def status
    if thread_sleeping?
      render 'search'
    else
      redirect_to results_path
    end
  end

  def results
    end_thread
    puts @@results
  end

  private
    def perform_search
      @@results = Tickets.find(1)
    end

    def start_thread(params)
      perform_search
      @@new_thread = Thread.new{ make_thread_sleep }
    end

    def end_thread
      @@new_thread.join
    end

    def thread_sleeping?
      @@new_thread.status == "sleep"
    end

    def make_thread_sleep
      sleep(10)
    end
end
