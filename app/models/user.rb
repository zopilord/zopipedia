class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :wiki_collaborators
  has_many :wikis, through: :wiki_collaborators
  before_create :set_member, :set_free_account
  ROLES = %w[admin member]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end 

  def make_premium
     self.update_attribute(:free, false)
  end 

  private
    def set_member
      self.role = "member"
    end  

    def set_free_account
      self.free = true
    end  
end

