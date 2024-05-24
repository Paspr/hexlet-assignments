# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  # def setup
  #   stack = Stack.new
  # end

  def test_push_method
    stack = Stack.new
    expected_value = 'ruby'
    stack.push! expected_value
    expected_size = 1
    assert(stack.to_a[0] == expected_value)
    assert(stack.size == expected_size)
  end

  def test_pop_method
    stack = Stack.new
    expected_value = 'ruby'
    expected_size = 0
    stack.push! expected_value
    assert(stack.pop! == expected_value)
    assert(stack.size == expected_size)
  end

  def test_clear_method
    stack = Stack.new
    stack.push! 'ruby'
    expected_size = 0
    stack.clear!
    assert(stack.size == expected_size)
  end

  def test_empty_method
    stack = Stack.new
    expected_value = true
    assert(stack.empty? == expected_value)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
