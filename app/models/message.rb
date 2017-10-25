class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :upload_error, presence: true
  mount_uploader :image, ImageUploader

  private
  def upload_error
    body.presence or image.presence
  end

end
