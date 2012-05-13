class Userlist < ActiveRecord::Base
  attr_accessible :list_name
  validates :user_id, presence: true
  validates :list_name, presence: true, length: { maximum: 140 }
  belongs_to :user
  default_scope order: 'userlists.created_at DESC'
end
