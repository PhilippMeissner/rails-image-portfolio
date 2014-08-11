class Project < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? } 
  mount_uploader :featured_image, ImageUploader
  validates :name, :description, :featured_image,  presence: true
end
