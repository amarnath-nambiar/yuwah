class CollegesController < ApplicationController
  before_action :set_college, only: %i[ show update destroy ]

  # GET /colleges
  def index
    @colleges = College.all

    render json: @colleges
  end

  # GET /colleges/1
  def show
    render json: @college
  end

  # POST /colleges
  def create
    @college = College.new(college_params)

    if @college.save
      render json: @college, status: :created, location: @college
    else
      render json: @college.errors, status: :unprocessable_entity
    end
  end

  def search
    query = params[:query]
    @colleges = College.where("name ILIKE ? OR city ILIKE ? OR state ILIKE ? OR country ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    render json: @colleges
  end

  # PATCH/PUT /colleges/1
  def update
    if @college.update(college_params)
      render json: @college
    else
      render json: @college.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colleges/1
  def destroy
    @college.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def college_params
      params.require(:college).permit(:name, :city, :state, :country, :established_year, :website, :description)
    end
end
