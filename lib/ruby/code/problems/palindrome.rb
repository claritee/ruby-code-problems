module Ruby::Code::Problems
  class Palindrome
    INPUT_PARTS = 2

    def find_next(input)
      digits = "#{input}".split("").map { |digit| digit.to_i }
      left = left_half(digits)
      right = right_half(digits)
      if left < right
        merge(left + 1, left + 1, digits.count)
      end
    end

    private

    def left_half(input)
      input[0..(mid(input)-1)].join.to_i
    end

    def right_half(input)
      mid = mid(input)
      input[mid..(input.count - 1)].join.to_i
    end

    def mid(input)
      length = input.count
      (length % INPUT_PARTS == 0) ? length/INPUT_PARTS : length/INPUT_PARTS
    end

    def merge(left, right, length)
      "#{left}#{reverse(right, length)}".to_i
    end

    def reverse(input, length)
      (length % 2 == 0) ? "#{input}".reverse : "#{input}".slice(1, input.count - 1).reverse
    end
  end
end