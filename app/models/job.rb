class Job < ActiveRecord::Base
  has_many :images
  
  if Rails.env.production?
    scope :starts_with, -> (number) { where("CAST(number AS TEXT) like ?", "#{number}%")}
  else
    scope :starts_with, -> (number) { where("number like ?", "#{number}%")}
  end
end
