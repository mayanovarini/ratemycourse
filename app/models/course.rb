class Course < ApplicationRecord
  has_many :reviews
  belongs_to :users, optional: true

  validates :code, :name, :department, presence: true


  def avg_rating
    @reviews = Review.where(course_id: self.id)
    if @reviews.blank?
      0
    else
      @reviews.average(:rating).round(1)
    end
  end
end
