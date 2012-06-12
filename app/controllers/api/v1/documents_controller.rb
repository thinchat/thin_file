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
        doc = Document.create(file: params['file'],
                              user_id: params['user_id'],
                              user_type: params['user_type'],
                              room_id: params['room_id'],
                              user_display_name: params['user_display_name']
                              )
        render json: {file_url: doc.file_url,
                      file_name: doc.file.identifier,
                      user_id: doc.user_id,
                      user_type: doc.user_type,
                      room_id: doc.room_id,
                      user_display_name: params['user_display_name']}
      end

      def update
        respond_with Document.update(params[:id], params[:document])
      end

      def destroy
        respond_with Document.destroy(params[:id])
      end

    end
  end
end