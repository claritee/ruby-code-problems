module Ruby::Code::Problems
  class Palindrome
    INPUT_PARTS = 2
    END_OF_RANGE = 9

    def find_next(input)
      digits = to_array(input).map { |digit| digit.to_i }
      leftVal = left_half(digits, digits.count)
      rightVal = right_half(digits, digits.count)

      if leftVal < rightVal
        merge(leftVal + 1, leftVal + 1, digits.count)
      elsif leftVal == rightVal
        if end_of_range?(leftVal)
          leftVal += 1
          leftArr = to_array(leftVal)
          rightVal = leftArr.first(leftArr.count - 1).join
        else
          leftVal += 1
          rightVal = leftVal
        end
        merge(leftVal, rightVal, digits.count)
      else
        merge(leftVal, leftVal, digits.count)
      end
    end

    private


    def to_array(input)
      input.to_s.split('')
    end

    def left_half(input, length)
      end_pos = (length % INPUT_PARTS == 0) ? length/INPUT_PARTS - 1 : length/INPUT_PARTS
      input[0..end_pos].join.to_i
    end

    def right_half(input, length)
      start_pos = input.count % INPUT_PARTS == 0 ? length/INPUT_PARTS : length/INPUT_PARTS - 1
      input[start_pos..(input.count - 1)].join.to_i
    end

    def merge(left, right, length)
      "#{left}#{reverse(right, length)}".to_i
    end

    def reverse(input, length)
      (length % INPUT_PARTS == 0) ? input.to_s.reverse : input.to_s.reverse.slice(1, input.to_s.length - 1)
    end

    def end_of_range?(leftVal)
      leftVal % END_OF_RANGE == 0
    end
  end
end