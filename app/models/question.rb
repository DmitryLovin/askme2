class Question < ApplicationRecord
  validates :body,
            presence: true,
            length: { maximum: 240 }
end
