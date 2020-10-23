class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to tweets_path
  end

  private

  def tweet_params
    if student_signed_in?
      params.require(:tweet).permit(:text).merge(student_id: current_student.id)
    elsif teacher_signed_in?
      params.require(:tweet).permit(:text).merge(teacher_id: current_teacher.id)
    else
      params.require(:tweet).permit(:text)
    end
  end
end
