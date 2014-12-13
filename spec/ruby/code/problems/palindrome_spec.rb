require 'spec_helper'
require 'ruby/code/problems/palindrome'

describe Ruby::Code::Problems::Palindrome do
  let(:palindrome) { Ruby::Code::Problems::Palindrome.new }

  describe 'generate the next palindrome' do
    it { expect(palindrome.find_next(19)).to eq 22 }
  end
end