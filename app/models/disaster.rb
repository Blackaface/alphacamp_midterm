class Disaster < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates_presence_of :title , :content

  delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
