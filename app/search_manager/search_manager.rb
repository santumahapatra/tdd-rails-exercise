class SearchManager
  attr_reader :params, :search_thread, :results, :name

  def initialize(params, name)
    @params = params
    @name = name
    @results = []
  end

  def name?(name)
    @name == name
  end

  def initiate_search
    @search_thread = Thread.new{ search_database_and_sleep }
  end

  def search_database_and_sleep
    go_to_sleep
    start_search
  end

  def end_thread
    @search_thread.join
  end

  def start_search
    @results = Tickets.where(:from => [@params["from"]])
  end

  def go_to_sleep
    sleep(10)
  end

  def thread_alive?
    @search_thread.alive?
  end

  def search_results
    @results
  end
end
