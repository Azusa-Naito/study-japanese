class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @tweets = Tweet.where(student_id: @student.id)
  end
end
