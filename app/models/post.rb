class Post < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true, length:{maximum: 5}
	default_scope -> {order('created_at DESC')}
end

