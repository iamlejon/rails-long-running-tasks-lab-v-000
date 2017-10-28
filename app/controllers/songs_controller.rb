class SongsController < ApplicationController
require 'csv'
  def index
    @songs = Song.all
  end

  def upload
    CSV.foreach(params[:file].path, headers: true) do |song|
      Song.create(title: lead[0], artist_name: song[1])
    end
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
