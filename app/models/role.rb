class Role < ActiveRecord::Base
  belongs_to :wiki_id
  belongs_to :user_id
end
