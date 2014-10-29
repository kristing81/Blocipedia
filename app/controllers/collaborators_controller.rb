class CollaboratorsController < ApplicationController
  attr_accessor :user_id, :wiki_id
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = Collaborator.where(:id => :wiki_id)
    @collaborators = @wiki.collaborators
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where(email: params[:email]).first
    if @user.present?
      @wiki.roles.create(role: "collaborator", user_id: @user.id)
      flash[:notice] = "Collaborator was saved successfully."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your collaborator. Please try again."
      render :new
    end
  end


  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    
    if @wiki.roles.where(user_id: params[:id]).first.destroy
      flash[:notice] = "Collaborator was deleted successfully"
      redirect_to @wiki
    else
      flash[:error] = "There was an error deleting your collaborator.  Please try again."
      render :show
    end
  end
end
