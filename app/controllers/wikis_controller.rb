class WikisController < ApplicationController

  before_filter :authenticate_user!

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    @collaborators = @wiki.collaborators
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Your wiki was saved"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki.  Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki updated"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error saving the wiki.  Please try again"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    title = @wiki.title

    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show 
  end  
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user_id)
  end
end
