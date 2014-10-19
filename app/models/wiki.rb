class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  has_many :roles
  has_many :users, through: :roles
  
  # def should_generate_new_friendly_id?
  #   new_record?
  # end
end
