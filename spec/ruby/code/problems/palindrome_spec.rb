require 'spec_helper'
require 'ruby/code/problems/palindrome'

describe Ruby::Code::Problems::Palindrome do
  let(:palindrome) { Ruby::Code::Problems::Palindrome.new }

  describe 'generate the next palindrome' do
    it { expect(palindrome.find_next(19)).to eq 22 }
    it { expect(palindrome.find_next(88)).to eq 99 }
    it { expect(palindrome.find_next(99)).to eq 101 }
    it { expect(palindrome.find_next(98)).to eq 99 }
    it { expect(palindrome.find_next(8999)).to eq 9009 }
    it { expect(palindrome.find_next(12345)).to eq 12421 }
  end
end