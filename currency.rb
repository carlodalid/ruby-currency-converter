#!/usr/local/bin/ruby

require './convertor'

@conv = Convertor.new

# invoked on progrom launch
# requires user input for fromCurr and toCurr
def run
  print "From Currency: "
  fromCurr = gets.chomp

  print "To Currency: "
  toCurr = gets.chomp

  currVal = @conv.getCurrConversion( fromCurr, toCurr )
  if currVal == false
    help
  else
    print "#{fromCurr} to #{toCurr}: #{currVal} \n"
  end

  nextstep
end

# outputs warning string when user input is invalid
def help
  puts "Invalid code input. Please check the following URL for valid currencies:"
  puts "http://www.webservicex.net/CurrencyConvertor.asmx"
end

# invoked on successful or unsuccessful currency conversion
# requires user input
def nextstep
  puts "Input 't' to try again or 'q' to end program: "
  try = gets.chomp

  if try == "t" 
    run
  elsif try == "q"
    exit
  else
    puts "Invalid response."
    nextstep
  end
end

run
