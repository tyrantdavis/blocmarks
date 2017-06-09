class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_topic

  def index
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)
    authorize @bookmark

      if @bookmark.save
        flash[:notice] = "Bookmark was saved."
        redirect_to @topic
      else
        flash[:error] = "There was an error saving the bookmark. Please try again."
        render :new
      end
   end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
   @bookmark = Bookmark.find(params[:id])
   @bookmark.assign_attributes(bookmark_params)
   authorize @bookmark

   if @bookmark.save
     flash[:notice] = "Bookmark was updated."
     redirect_to @topic
   else
     flash[:error] = "There was an error saving this bookmark. Please try again."
     render :edit
   end
 end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
