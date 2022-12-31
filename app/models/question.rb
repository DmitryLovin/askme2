class Question < ApplicationRecord
  after_commit :save_new_tags, on: %i[ create update ]

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_many :question_tags, dependent: :delete_all
  has_many :tags, through: :question_tags, source: :hash_tag

  validates :body,
            presence: true,
            length: { maximum: 240 }

  def save_new_tags(tags = [])
    self.tags.clear if self.tags.any?

    hashtags = body.gsub(HashTag::REGEX)
    hashtags += answer.gsub(HashTag::REGEX) if answer.present?
    hashtags = hashtags.map { |match| match.delete("#").downcase }
    hashtags.uniq!

    self.tags = hashtags.map { |tag| HashTag.find_or_create_by(text: tag) }
  end
end
