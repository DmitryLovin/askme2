class Question < ApplicationRecord
  before_commit :save_new_tags, on: :create
  before_commit :update_tags, on: :update

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_many :question_tags, dependent: :delete_all
  has_many :tags, through: :question_tags, source: :hash_tag

  validates :body,
            presence: true,
            length: { maximum: 240 }

  def save_new_tags
    hashtags = HashtagParser.parse(body)
    hashtags.uniq! { |tag| tag[:text].downcase }

    self.tags = hashtags.map { |tag| HashTag.find_or_create_by(text: tag[:text].downcase) }
  end

  def update_tags
    self.tags.clear

    hashtags = HashtagParser.parse(body)
    hashtags.concat(HashtagParser.parse(answer)) if answer.present?
    hashtags.uniq! { |tag| tag[:text].downcase }

    self.tags = hashtags.map { |tag| HashTag.find_or_create_by(text: tag[:text].downcase) }
  end
end
