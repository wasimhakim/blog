class Post < ApplicationRecord
  # 
  # Validations
  # 
  validates :title, :description, presence: true
  
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
