class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  # def should_generate_new_friendly_id?
  #   new_record?
  # end
end
