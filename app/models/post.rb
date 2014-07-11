class Post < ActiveRecord::Base
	enum text: [:yo,:no,:bro,:go,:oh]
	validates :text,presence:true
	default_scope {order created_at: :desc}
end
