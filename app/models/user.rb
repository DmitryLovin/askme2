class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  has_many :questions, dependent: :delete_all

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A[0-9a-z_]+\z/i, message: "only allows digits, letters and underscore symbols (_)" }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :color,
            allow_blank: true,
            format: { with: /\A#[0-9a-f]{6}\z/i}

  def downcase_nickname
    nickname.downcase!
  end
end
