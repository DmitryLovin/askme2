module QuestionsHelper
  def split_lines(question)
    question.body.split("\r\n")
  end
end
