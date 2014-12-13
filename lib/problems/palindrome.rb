# Public: Palindrome class
#
# Examples
#
#   Palidrome.new.find_next(11)
#   # => 22
module Problems
  class Palindrome
    INPUT_PARTS = 2
    END_OF_RANGE = 9

    # Public: Find the next palindrome from an input number
    #
    # input  - an integer to find the next palindrome
    #
    # Examples
    #
    #   find_next(22)
    #   # => 33
    #
    # Returns an integer for the next palindrome
    #
    # Algorithm:
    #if n % 2 == 0
    #  L = digits[0, n/2 - 1]
    #  R = digits[n/2, n - 1]
    #else
    #  L = digits[0, n/2]
    #  R = digits[n/2, n - 1]
    #end
    #
    # L : R
    # if L > R
    #   if L % 9 == 0
    #     if n % 2 == 0 then [L][L]
    #     else [L+1][reverse L+1 n/2-1 digits]
    #   end
    # elsif L < R
    #   if n % 2 then [L+1][reverse L+1]
    #   else [L+1][reverse L+1 n/2-1 digits]
    # else
    #   if L % 9 == 0 (end of range) then
    #     [L+1][reverse L+1 n/2-1-digits]
    #   else [L+1][reverse L+1]
    # end
    def find_next(input)
      digits = to_array(input).map { |digit| digit.to_i }
      length = digits.count
      left_val = left_half(digits, length)
      right_val = right_half(digits, length)
      right_reversed = right_val.to_s.reverse.to_i

      if left_val < right_reversed
        merge(left_val + 1, left_val + 1, length)
      elsif left_val == right_reversed
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
        result = merge(left_val, left_val, length)
        result = merge(left_val + 1, left_val + 1, length) if result <= input
        result
      end
    end

    private


    def to_array(input)
      input.to_s.split('')
    end

    def left_half(digits, length)
      length.even? ? digits[0..(length/INPUT_PARTS - 1)].join.to_i : digits[0..(length/INPUT_PARTS)].join.to_i
    end

    def right_half(digits, length)
      digits[(length/INPUT_PARTS)..(length - 1)].join.to_i
    end

    def merge(left, right, length)
      "#{left}#{reverse(right, length)}".to_i
    end

    def reverse(input, length)
      (length % INPUT_PARTS == 0) ? input.to_s.reverse : input.to_s.reverse.slice(1, input.to_s.length - 1)
    end

    def end_of_range?(input)
      input % END_OF_RANGE == 0
    end
  end
end