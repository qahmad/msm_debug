class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    
    @movie = Movie.new
  
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    render("movies/show.html.erb")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row

    @movie = Movie.find_by({ :Id => params["id"] })

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("movies/show.html.erb")
  end

  def destroy
    movie = Movie.find_by({ :Id => params["id"] })
    movie.destroy

    redirect_to("/movies")

  end
end
