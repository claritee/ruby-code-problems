module Ruby::Code::Problems
  class Palindrome
    INPUT_PARTS = 2
    END_OF_RANGE = 9

    def find_next(input)
      digits = to_array(input).map { |digit| digit.to_i }
      left_val = left_half(digits, digits.count)
      right_val = right_half(digits, digits.count)

      if left_val < right_val
        merge(left_val + 1, left_val + 1, digits.count)
      elsif left_val == right_val
        if end_of_range?(left_val)
          left_val += 1
          left_arr = to_array(left_val)
          right_val = left_arr.first(left_arr.count - 1).join
        else
          left_val += 1
          right_val = left_val
        end
        merge(left_val, right_val, digits.count)
      else
        merge(left_val, left_val, digits.count)
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
      start_pos = input.count % INPUT_PARTS == 0 ? length/INPUT_PARTS - 1 : length/INPUT_PARTS
      input[start_pos..(length - 1)].join.to_i
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