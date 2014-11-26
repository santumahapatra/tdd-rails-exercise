class StaticPagesController < ApplicationController

  def home
  end

  def search
    session[:name] = construct_session_name
    search_object = SearchManager.new(params, session[:name])
    search_object.initiate_search
    render "search"
  end

  def status
    search_object = get_search_object(session[:name])
    if search_object.thread_alive?
      render 'search'
    else
      redirect_to results_path
    end
  end

  def results
    search_object = get_search_object(session[:name])
    @ticket_results = search_object.search_results
    search_object.end_thread
  end

  private
    def construct_session_name
      session_string(random_number, time_stamp)
    end

    def random_number
      random_number = Random.rand(10000) + 50
    end

    def time_stamp
      time_stamp = Time.now.to_i
    end

    def session_string(random_number, time_stamp)
      "#{random_number}#{time_stamp}"
    end

    def get_search_object(session_name)
      ObjectSpace.each_object(SearchManager).detect { |klass| klass.name?(session_name) }
    end
end
