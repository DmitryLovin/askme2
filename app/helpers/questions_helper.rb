module QuestionsHelper
  def split_lines(text)
    text.split("\r\n")
  end

  def parse_tags(line)
    line.split(/(#[[:alpha:]]+\w+)/).map do |element|
      if element.match(/#[[:alpha:]]+\w+/)
        link_to(element, hash_tag_path(element.delete("#")), class: "in-text-hash-tag").html_safe
      else
        element
      end
    end
  end
end
