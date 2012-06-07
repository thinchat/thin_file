class DocumentsController < ApplicationController
  def create
    @document = Document.create(params[:document])
    redirect_to new_document_path
  end

  def new
    @document = Document.new
  end

  def show
    @document = Document.find(params[:id])
  end
end