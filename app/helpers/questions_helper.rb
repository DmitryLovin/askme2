module QuestionsHelper
  def split_lines(text)
    text.split("\r\n")
  end

  def with_tags(line)
    tags = HashtagParser.parse(line)
    if tags.any?
      result = [{ text: line[0...tags[0][:start]] }]
      tags.each_with_index do |tag, index|
        result << { hashtag: "#{tag[:text]}" }
        unless tag == tags.last
          result << { text: line[tag[:end] + 1...tags[index + 1][:start]] }
        end
      end
      result << { text: line[tags.last[:end] + 1..line.length] }
    else
      [{ text: line }]
    end
  end

  def render_element(element)
    if element[:hashtag]
      link_to("##{element[:hashtag]}",
              questions_path(hash_tag: element[:hashtag]),
              class: "in-text-hash-tag").html_safe
    else
      element[:text]
    end
  end
end
