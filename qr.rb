# Write your solution here!
# Write your solution here!
require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts ""
puts "Press 4 to exit"

user_input = gets.chomp
puts

if user_input == "1"

  puts "What is the URL you would like to encode?"
  text_to_encode = gets.chomp.to_s
  puts

elsif user_input == "2"
  puts "What is the name of the wifi network?"
  network_name = gets.chomp
  puts

  puts "What is the password?"
  password = gets.chomp
  puts

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{password};;"


elsif user_input == "3"
  puts "What is the phone number you want the code to send a text message to?"
  phone_number = gets.chomp
  puts

  puts "What do you want to populate the message with?"
  message = gets.chomp
  puts

  text_to_encode = "SMSTO:#{phone_number}:#{message}"

elsif user_input == "4"
  puts
  puts "Goodbye!"
  exit

else
  puts
  puts "Didn't recognize that selection. Please try again."
  exit
end

qrcode = RQRCode::QRCode.new(text_to_encode)

puts "What would you like to call the PNG?"
image_name = gets.chomp

png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{image_name}.png", png.to_s)
