module Api
  module V1
    class DocumentsController < ApplicationController
      respond_to :json

      def index
        respond_with Document.all
      end

      def show
        respond_with Document.find(params[:id])
      end

      def create
        if Document.create_and_broadcast(attributes_with_filename(params), root_url)
          head :status => :created
        else
          head :status => :bad_request
        end
      end

      def update
        respond_with Document.update(params[:id], params[:document])
      end

      def destroy
        respond_with Document.destroy(params[:id])
      end

      private

      def attributes_with_filename(params)
        filename = params[:document].try(:[], :file).try(:original_filename)
        params[:document].merge(:filename => filename)
      end

    end
  end
end