class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :title, :tutor, :credit, :mandatory, :online, :review, :rating, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10,
    message: "can only be a whole number between 1 and 10"
  }
end
