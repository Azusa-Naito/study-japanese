class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    @tweets = Tweet.where(teacher_id: @teacher.id)
    @posts = Post.where(teacher_id: @teacher.id)
  end
end
