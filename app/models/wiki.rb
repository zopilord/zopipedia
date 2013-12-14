class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :private
  belongs_to :user
  has_many :wiki_collaborators
  has_many :users, through: :wiki_collaborators
end
