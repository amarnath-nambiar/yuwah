class CollegesController < ApplicationController

  def profile
    @college = College.find(params[:id])
    @courses = @college.courses
  end

  def search
    query = params[:query]
    @colleges = College.where("name ILIKE ? OR city ILIKE ? OR state ILIKE ? OR country ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    render json: @colleges
  end
end
