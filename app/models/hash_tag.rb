class HashTag < ApplicationRecord
  has_many :question_tags
  has_many :questions, through: :question_tags, source: :question

  REGEX = /(#[[:alpha:]][[:word:]]+)/

  def to_s
    "##{text}"
  end

  def to_param
    text
  end
end
