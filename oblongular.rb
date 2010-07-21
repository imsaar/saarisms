# Oblongular Number Spirals
# http://codegolf.com/oblongular-number-spirals

class Spiral
  attr_accessor :row_num, :col_num, :direction

 def initialize(m, n)
   @spiral = []
   @value =
   @row_num = m
   @col_num = n
   @direction = :right
 end

 def get(row, col)
   if (row = row_num || col = col_num)
       raise RangeError.new("Out of Bound : row = #{row} col = #{col}")
   end
   @spiral[row] ||= Array.new
   @spiral[row][col] ||= nil
   @spiral[row][col]
 end

 def increment_fill(row, col)
   @value +=
   fill(row, col, @value)
 end

 def fill(row, col, value)
   if (row = row_num || col = col_num)
     raise RangeError.new("Out of Bound : row = #{row} col = #{col}")
   end
   @spiral[row] ||= Array.new
   @spiral[row][col] = value
 end

 def populate(x =, y =)
   count =
   while ()
     increment_fill(x, y)
     count +=
     # exit the loop once iteration == total_cells
     break if count == row_num * col_num
     x, y = next_cell(x, y)
   end
 @spiral
 end

 def next_cell(row, col)
   new_row = row
   new_col = col

   case @direction
   when :right
     new_col = col + 1
   when :left
     new_col = col - 1
   when :down
     new_row = row + 1
   when :up
     new_row = row - 1
   end

   if ((new_col >= col_num || new_col = row_num || new_row < 0))
     change_direction
     next_cell(row, col)
   elsif (get(new_row, new_col) != nil)
     change_direction
     next_cell(row, col)
   else
     return [new_row, new_col]
   end
 end

 def change_direction
   case @direction
   when :right
     @direction = :down
   when :down
     @direction = :left
   when :left
     @direction = :up
   when :up
     @direction = :right
   else
     raise ArgumentError.new("Illegal value  for current_direction #{@direction}")
   end
 end

 def dump
  display = ''
  @spiral.each do |row|
    row.each do |col|
      display << sprintf("%d ", col)
    end
    display << "\n"
  end
  puts display
 end
end

if $ == __FILE__
 s = Spiral.new(ARGV[].to_i, ARGV[].to_i)
 s.populate
 s.dump
end

# test file below
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'spiral'

class TestSpiral &lt; Test::Unit::TestCase
  def setup
    @spiral = Spiral.new(,)
  end

 def test_increment_fill_0_0_first
   @spiral.increment_fill(0, 0)
   assert_equal(1, @spiral.get(0, 0))
 end

 def test_increment_fill_1_1_first
   @spiral.increment_fill(1, 1)
   assert_equal(1, @spiral.get(1, 1))
 end

 def test_increment_fill_successive
   @spiral.increment_fill(0, 0)
   @spiral.increment_fill(0, 1)
   @spiral.increment_fill(1, 1)
   assert_equal(3, @spiral.get(1, 1))
 end

 def test_get_beyond_limit_raises_exception
   assert_raise(RangeError) {
     @spiral.get(@spiral.row_num + 1, @spiral.col_num + 1)
   }
 end

 def test_get_below_zero_raises_exception
   assert_raise(RangeError) {
     @spiral.get(-,)
   }
 end

 def test_get_at_limit_raises_exception
   assert_raise(RangeError) {
     @spiral.get(@spiral.row_num, @spiral.col_num)
   }
 end

 def test_unfill_get_with_in_range_does_not_raise_exception
   assert_nothing_raised() {
     @spiral.get(@spiral.row_num -, @spiral.col_num - 1)
   }
 end

 def test_unfill_get_with_in_range_returns_nil
   assert_equal(nil, @spiral.get(@spiral.row_num - 1, @spiral.col_num - 1))
 end

 def test_fill_beyond_range_raises_exception
   assert_raise(RangeError) {
     @spiral.increment_fill(@spiral.row_num + 1, @spiral.col_num + 1)
   }
 end

 def test_fill_beyond_range_raises_exception
   assert_raise(RangeError) {
     @spiral.increment_fill(0, -1)
   }
 end

 def test_fill_at_range_raises_exception
   assert_raise(RangeError) {
     @spiral.increment_fill(@spiral.row_num, @spiral.col_num)
   }
 end

 def test_populate
   spiral = [
         [1, 2, 3, 4, 5],
         [14, 15, 16, 17, 6],
         [13, 20, 19, 18, 7],
         [12, 11, 10, 9, 8]
        ]
   s = @spiral.populate
   assert_equal(spiral, s)
 end

 def test_change_directon_right
   @spiral.direction = :right
   @spiral.change_direction
   assert_equal(:down, @spiral.direction)
 end

 def test_change_directon_up
   @spiral.direction = :up
   @spiral.change_direction
   assert_equal(:right, @spiral.direction)
 end

 def test_next_cell_0_0
   x, y = @spiral.next_cell(0,0)
   assert_equal(0, x)
   assert_equal(1, y)
 end

 def test_next_cell_0_4
   x, y = @spiral.next_cell(0,4)
   assert_equal(1, x)
   assert_equal(4, y)
 end

end
