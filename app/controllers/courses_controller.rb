class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @course = Course.find params[:id]
  end

  def index
    @courses = Course.all.paginate page: params[:page]
  end
end
