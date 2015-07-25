# Method loads the filed located at the proveded path and counts number of bits
# set to zero and number of bits set to one.
# Result is printed to stdout.
#
# In case you provide non-existing file, method prints an error message.
#
# Run [require 'bit_counter.rb'] from your IRB to use this method.
def count_bits(path)

  if path.nil? or path.empty?
  	puts 'Please provide a path to file'
  	return
  end

  begin

    # Open file, load it's content and close it (binread does this all for you :) )
    file = IO.binread(path)

    # Get a bit string for the whole file
    bits = file.unpack('B*')[0]

    # For timing
    start = Time.now

    # Just count occurences of ones and zeroes and print them...
    puts "Found #{bits.count('1')} bits set to 1"
    puts "Found #{bits.count('0')} bits set to 0"

    # Print the time needed
    puts "It took me #{((Time.now - start) * 1000).round(2)}ms to get those numbers"

  rescue SystemCallError
  	# File does not exist, so print a message
    puts 'Invalid file'
  end

end
