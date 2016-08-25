class BookmarksController < ApplicationController

  def show
    @bookmark = @topic.bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to @topic
    else

      flash.now[:alert] = "There was and error saving the bookmark. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted"
       redirect_to @topic
    else

      flash.now[:alert] = "There was and error Deleting the bookmark. Please try again."
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving the Bookmark. Please try again."
      render :edit
    end
  end
end

private

def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
end
