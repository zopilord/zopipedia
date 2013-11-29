class Wiki < ActiveRecord::Base
  attr_accessible :body, :public, :title
  belongs_to :user
end
