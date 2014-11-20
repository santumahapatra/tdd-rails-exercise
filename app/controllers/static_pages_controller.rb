class StaticPagesController < ApplicationController
  @@results ||= []
  attr_reader :ticket_results

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
    @ticket_results = @@results
    end_thread
  end

  private
    def perform_search(params)
      @@results = Tickets.where(:from => [params["from"]])
    end

    def start_thread(params)
      @@new_thread = Thread.new{ search_and_sleep(params) }
    end

    def end_thread
      @@new_thread.join
    end

    def thread_sleeping?
      @@new_thread.status == "sleep"
    end

    def search_and_sleep(params)
      perform_search(params)
      sleep(1)
    end
end
