class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :roles
  has_many :wikis, through: :roles

  scope :premium, -> { where(premium: true) }

  def premium?
    self.role.eql? "premium"
  end
end
