class TopsController < ApplicationController
  before_action :redirect
  def index
    
  end

  private

  def redirect
    if student_signed_in? || teacher_signed_in?
      redirect_to tweets_path
    end
  end
end
