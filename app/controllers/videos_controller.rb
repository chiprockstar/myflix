class VideosController < ApplicationController
  def index
    @categories = Category.all
    @videos = Video.all
  end

  def show
    @video = Video.first
  end
end
