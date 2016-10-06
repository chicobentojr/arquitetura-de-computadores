
print "Input the filename that you want read:"

filename = gets.chomp

filename = "simple-code.txt" if filename.size == 0

result_hex = []

File.open(filename, "r") do |f|
  f.each_line do |line|
    # puts line
    bin_code  = line.to_i(2)
    result_hex.push(bin_code.to_s(16))
  end
end

puts 'clear'
puts result_hex
