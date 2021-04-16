class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
