class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  after_initialize :set_user
  def set_user
  	self.user = User.last
  	
  end
end
