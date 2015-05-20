module Encrypt

  ALPHABETICAL_REGEX = /^[[:alpha:]]$/

  def encode(string, number_of_shifts)
    string.chars.each do |c|
      encode_char(c, number_of_shifts)
    end.join
  end

  private

    def encode_char(char, number_of_shifts)
      if char.match(ALPHABETICAL_REGEX)
        number_of_shifts.times do
          char.next!
          char.slice!(0) unless char.length == 1
        end
      end
    end
end
