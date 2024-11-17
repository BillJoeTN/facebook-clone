class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :content, presence: true

  # Define which attributes can be searched
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "updated_at", "user_id"]
  end

  # If you want to search associations, add this method too
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
