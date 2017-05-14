class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, with: /\@mail.ccsf\.edu/, message: ': You can only use a student email address from CCSF'
  has_many :reviews, dependent: :destroy
  has_many :courses
end
