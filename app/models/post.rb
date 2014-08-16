class Post < ActiveRecord::Base
  enum text: [:yo,:no,:bro,:go,:oh]
  validates :text, presence: true
  default_scope {order created_at: :desc}
  after_initialize :set_defaults
  belongs_to :user
  def set_defaults
    self.text ||= :yo
  end
end
