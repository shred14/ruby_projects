module Substring

  def magic(string, dictionary)
    result = {}
    words = string.split(/\W+/)

    dictionary.each do |search_term|
      count = words.count { |word| word.downcase.match(search_term) }
      result[search_term] = count if count > 0
    end

    result
  end
end
