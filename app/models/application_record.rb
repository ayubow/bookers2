class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    has_one_attached :profile_image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/image/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
  
end
