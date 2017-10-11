# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
    
   def create
       #params.require(:movie)
       #params[:movie].permit(:title,:rating,:release_date)
       # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
       @movie = Movie.create!(params[:movie])
       flash[:notice] = "#{@movie.title} was successfuly created." 
       redirect_to movies_path
   end 
   def index
    @movies = Movie.all
   end

# in app/controllers/movies_controller.rb

def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
end 

def new
    @movie = Movie.new
    # default: render 'new' template
end 

def edit
    @movie = Movie.find params[:id]
end 

def update 
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfuly updated."
    redirect_to movie_path(@movie)
end 

def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
end 
end 