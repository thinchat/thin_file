module Api
  module V1
    class PicturesController < ApplicationController
      respond_to :json

      def index
        respond_with Picture.all
      end

      def show
        respond_with Picture.find(params[:id])
      end

      def create
        respond_with Picture.create(params[:picture])
      end

      def update
        respond_with Picture.update(params[:id], params[:product])
      end

      def destroy
        respond_with Picture.destroy(params[:id])
      end

    end
  end
end