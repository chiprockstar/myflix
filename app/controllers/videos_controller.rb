class VideosController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @video = Video.find_by id: params[:id]
  end

  def search
    @videos = Video.search_by_title(params[:title])
  end
end
