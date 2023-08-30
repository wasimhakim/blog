class Post < ApplicationRecord
  # 
  # Validations
  # 
  validates :title, presence: true

  # 
  # Action Text
  # 
  has_rich_text :content
  
  # 
  # Associations
  # 
  belongs_to :page
  belongs_to :user

  # 
  # Scopes
  # 
  default_scope { order(created_at: :desc) }
end
