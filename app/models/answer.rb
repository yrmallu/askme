class Answer < ApplicationRecord
  belongs_to :user
  validates_associated :user
  belongs_to :question
  validates_associated :question
end
