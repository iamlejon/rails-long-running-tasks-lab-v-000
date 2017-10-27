class SongsController < ApplicationController
require 'csv'
  def index
    @songs = Song.all
  end

  def upload
    CSV.foreach(params[:file].path, headers: true) do |lead|
      Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
    end
    redirect_to customers_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

