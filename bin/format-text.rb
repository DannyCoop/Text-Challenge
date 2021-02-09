require_relative '../lib/get_file_name.rb'
require_relative '../lib/format_text_final.rb'

if(ARGV.length > 0)
    new_file = Format_text_finaly.new
    new_file.format_text(ARGV[0])
else
    puts "You seem to have forgotten to add a file to format. Add a file below:"
    file_name = gets.chomp()
    get_file(file_name)
end




