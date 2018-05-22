class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to @topic, notice: 'The new topic "' + @topic.title + '" successfully was created!'
    else
      flash.now[:alert] = 'There was an error creating the topic. Please try again.'
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      redirect_to @topic, notice: 'The topic "' + @topic.title + '" was successfully updated!'
    else
      flash.now[:alert] = 'There was an error updating the topic. Please try again.'
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "#{@topic.title} was deleted successfully."
      redirect_to topics_path
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

end
