#!/usr/bin/env ruby
require 'problems/palindrome'

palindrome = Problems::Palindrome.new
puts "Enter a number to find the next palindrome"
puts palindrome.find_next(gets.to_i)