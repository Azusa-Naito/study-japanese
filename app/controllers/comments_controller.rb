class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comments = @tweet.comments.order('created_at DESC')
    @comment = Comment.new(comment_params)
    if @comment.save!
      redirect_to tweet_path(params[:tweet_id])
    else
      render "tweets/show"
    end
  end

  private

  def comment_params
    if student_signed_in?
      params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], student_id: current_student.id)
    elsif teacher_signed_in?
      params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], teacher_id: current_teacher.id)
    else
      params.require(:comment).permit(:text)
    end
  end

end