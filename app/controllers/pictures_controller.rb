class PicturesController < ApplicationController
  def create
    @picture = Picture.create(params[:picture])
    redirect_to new_picture_path
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
  end
end