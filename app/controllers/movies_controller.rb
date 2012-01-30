class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    if params[:title_sort]
      ordering,@title_header = {:order => :title}, 'hilite'
    elsif params[:release_date_sort]
      ordering,@date_header = {:order => :release_date}, 'hilite'
    end
    @all_ratings = Movie.all_ratings
    @selected_ratings = (params[:ratings] ||= {}).keys
    @movies = Movie.find_all_by_rating(@selected_ratings, ordering)
  end

  def new
    # default: render 'new' template
  end

  def create
    debugger
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
  end

end
