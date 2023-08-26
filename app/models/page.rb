class Page < ApplicationRecord
  # 
  # Validations
  # 
  validates :name, presence: true
  validates :phone, :whatsapp, numericality: true, length: { in: 10..12 }, allow_blank: true
  validate :phone_or_whatsapp

  # 
  # Associations
  # 
  belongs_to :user
  has_many :posts

  # 
  # Attachments
  # 
  has_one_attached :cover

  private

    def phone_or_whatsapp
      errors.add(:phone_or_whatsapp, "can't be blank") if phone.blank? && whatsapp.blank?
    end
end
