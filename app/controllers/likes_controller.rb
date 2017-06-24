class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark successfully liked."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Bookamrk like failed."
      redirect_to [@topic, @bookmark  ]
    end
  end

  def destroy
    # Get the bookmark from the params
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    # Find the current user's like with the ID in the params
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like


    if like.destroy
      # Flash success and redirect to @bookmark
      flash[:notice] = "Bookmark successfully unliked."
      redirect_to [@topic, @bookmark]
    else
      # Flash error and redirect to @bookmark
      flash[:error] = "Unlike failed. Please try again."
      redirect_to [@topic, @bookmark]
    end
  end
end
