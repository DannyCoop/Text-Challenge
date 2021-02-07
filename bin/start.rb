require_relative '../lib/get_file_name.rb'
require_relative '../lib/format_text.rb'

if(ARGV.length > 0)
    pp ARGV
    puts "Do you want to format the file(s) above? (y/n)"
    format_answer = STDIN.gets.chomp()
    if(format_answer.downcase === "y")
        format(ARGV)
    end

else
    puts "You seem to have forgotten to add a file to format. Add a file below:"
    file_name = gets.chomp()
    get_file(file_name)
end




