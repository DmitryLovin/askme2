class HashTag < ApplicationRecord
  has_many :question_tags, dependent: :delete_all
  has_many :questions, through: :question_tags, source: :question

  REGEX = /#[[:alpha:]][[:word:]]+/

  def to_param
    text
  end
end
