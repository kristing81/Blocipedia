class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  has_many :roles
  has_many :users, through: :roles

  #scope :visible_to, -> (user) { user ? all : where(premium: true) }
  scope :private, lambda { |user| user ? scoped : where(premium: true) }

  def make_premium
    self.update_attribute(:private, true)
  end 

  def collaborators
    self.roles.where(role: "collaborator").includes(:user).collect(&:user)
  end

end
