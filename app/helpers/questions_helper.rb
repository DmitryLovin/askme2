module QuestionsHelper
  def split_lines(text)
    text.split("\r\n")
  end

  def parse_tags(line)
    line.gsub(HashTag::REGEX) do |tag|
      link_to(tag, hash_tag_path(tag), class: "in-text-hash-tag")
    end
  end
end
