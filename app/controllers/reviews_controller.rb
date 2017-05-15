class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_course
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    puts params
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.course_id = @course.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @course, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to course_path(@course), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def check_user
      unless (@review.user == current_user)
        redirect_to root_url, alert: "Sorry, only the original author can alter this review"
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:tutor, :semester, :year, :title, :credit, :mandatory, :online, :review, :reading1, :reading2, :reading3, :reading4, :rating)
    end
end
