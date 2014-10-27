class CollaboratorsController < ApplicationController
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = Collaborator.all
    @collaborators = @wiki.collaborators
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.create(user_id: params[:user_id], wiki_id:  @wiki.id)
    if @collaborator.save
      flash[:notice] = "Collaborator was saved succesfully."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your collaborator. Please try again."
      render :new
    end
  end

    # find a user with an email matching what is specified in the parmas
    # if exists, create a new role on the wiki for that user as a collaborator.

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
