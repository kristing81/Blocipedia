class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborator.build(params[:collaborator])
    authorize @collaborator

    if @collaborator.save
      flash[:notice] = "Collaborator was successfully saved to #{wiki.title}"
    else
      flash[:notice] = "There was an error saving the collaborator.  Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "#{collaborator.name} was deleted successfully"
      redirect_to collaborator_index_path
    else
      flash[:error] = "There was an error deleting your collaborator.  Please try again."
      render :show
    end
  end
end
