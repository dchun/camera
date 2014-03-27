class Job < ActiveRecord::Base
  has_many :images
  scope :starts_with, -> (number) { where("number like ?", "#{number}%")}
end
