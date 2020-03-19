class Question < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true, length: { minimum: 250 }
  belongs_to :user
  # validates_associated :user
  has_many :answers
end
