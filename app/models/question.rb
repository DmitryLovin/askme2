class Question < ApplicationRecord
  belongs_to :user

  validates :body,
            presence: true,
            length: { maximum: 240 }

  def author
    User.find(author_id) if author_id.present?
  end
end
