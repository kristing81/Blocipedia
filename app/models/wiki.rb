class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  has_many :roles
  has_many :users, through: :roles

  scope :visible_to, -> (user) { user ? all : where(premium: true) }
  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  def collaborators
    self.roles.where(role: "collaborator").includes(:user).collect(&:user)
  end

end
