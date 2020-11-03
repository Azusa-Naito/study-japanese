class ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.save
    redirect_to post_path(@post.id)
  end

  private

  def review_params
    if student_signed_in?
      params.require(:review).permit(:difficult, :text).merge(student_id: current_student.id, post_id: @post.id)
    elsif teacher_signed_in?
      params.require(:review).permit(:difficult, :text).merge(teacher_id: current_teacher.id, post_id: @post.id)
    else
      params.require(:review).permit(:difficult, :text).merge(post_id: @post.id)
    end
  end
end
