class TopicsController < ApplicationController

  before_filter :authenticate_user!
  # after_action :verify_authorized, :except => [:index]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    authorize @topic

    if @topic.save
      flash[:notice] = "Topic successfully saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error creating the topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Topic updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :edit
    end
  end

    def destroy
      @topic = Topic.find(params[:id])
      authorize @topic

      if @topic.destroy
        flash[:notice] = "\"#{@topic.title}\" deleted successfully."
        redirect_to topics_path
      else
        flash[:error] = "There was an error deleting the topic."
        render :show
      end
    end

    private

    def topic_params
      params.require(:topic).permit(:title, :user)
    end

end
