# Without using any built in date or time functions, write a function or method
# that accepts two mandatory arguments. The first argument is a string of the
# format "[H]H:MM {AM|PM}" and the second argument is an integer. Assume the
# integer is the number of minutes to add to the string. The return value of
# the function should be a string of the same format as the first argument.
# For example AddMinutes(" AM",) would return " AM". The exercise
# isn't meant to be too hard. I just want to see how you code. Feel free to
# do it procedurally or in an object oriented way, whichever you prefer. Use
# any language you want. Write production quality code.
# Question Source: http://blist.com/blog/

 # the following solution was developed using TDD

 require 'test/unit'

 class TestTimeCalc < Test::Unit::TestCase

     def setup
         @time = " AM"
     end

     def test_new_time_cal
         assert_not_nil(TimeCalc.new)
     end

     def test_add_minute_zero
         assert_equal(@time, TimeCalc.add_minutes(@time,))
     end

     def test_add_minute_ten
         assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

     def test_add_minute_thirteen
         assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

     def test_add_hour
         assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

     def test_add_two_hours_fifteen_minutes
         assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

     def test_add_past_meridiem
         # minutes = hours and minutes
         assert_equal(" PM", TimeCalc.add_minutes(@time,))
     end

     def test_alpha_hour_min_format_throws_exception
         assert_raise(ArgumentError) { TimeCalc.add_minutes("AB:CD AM",) }
     end

     def test_bad_meridiem_throws_exception
         assert_raise(ArgumentError) { TimeCalc.add_minutes("AB:CD TM",) }
     end

     def test_hr_greater_than_twelve
         assert_raise(ArgumentError) { TimeCalc.add_minutes(" PM",) }
     end

     def test_min_greater_than_fifty_nine
         assert_raise(ArgumentError) { TimeCalc.add_minutes(" PM",) }
     end

     def test_add_lot_of_minutes
       # minutes = hours and minutes
       assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

     def test_add_up_to_noon
       # AM plus hr min ()
       assert_equal(" PM", TimeCalc.add_minutes(@time,))
     end

     def test_add_whole_lot_of_minutes
       # minutes = hours and minutes
       assert_equal(" AM", TimeCalc.add_minutes(@time,))
     end

 end # end class TestTimeCalc

 class TimeCalc

     def self.add_minutes(time, minutes)
       (hour, min, meridiem) = parse_time_string(time)

       hour_increment = (min + minutes)/
       min_increment = (min + minutes)% - min

       while (hour + hour_increment >)
         meridiem = (meridiem == 'AM' ? 'PM' : 'AM')
         hour_increment -=
       end

       hour += hour_increment
       # special case forth hour
       meridiem = (meridiem == 'AM' ? 'PM' : 'AM') if hour ==
       min += min_increment

       hour.to_s + ":" + sprintf('%d', min) + " " + meridiem
     end

     private

     def self.parse_time_string(time)
         raise ArgumentError unless (matches = time.match(/(\d{,}):(\d{,})\s+(\w{})/))
         matches = time.match(/^(\d{,}):(\d{,})\s+([A|P]M)$/)
         hour = matches[].to_i
         min = matches[].to_i
         meridiem = matches[]
         raise ArgumentError unless (hour <=)
         raise ArgumentError unless (min <)
         return [hour, min, meridiem]
     end
 end # end class TimeCalc

if __FILE__ == $
  puts TimeCalc.add_minutes(ARGV[], ARGV[].to_i)
end
