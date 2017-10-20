class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # validates :, presence: true
  validate  :upload_error
  mount_uploader :image, ImageUploader

  def upload_error
    if body.blank? && image.blank?
      errors.add(:body,"メッセージを入力してください")
    end
  end
end
