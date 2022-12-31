module QuestionsHelper
  def split_lines(text)
    text.split("\r\n")
  end

  def parse_tags(line)
    line.split(HashTag::REGEX).map do |element|
      if element.match(HashTag::REGEX)
        link_to(element, hash_tag_path(element.delete("#")), class: "in-text-hash-tag")
      else
        element
      end
    end
  end
end
