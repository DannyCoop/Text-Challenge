require_relative '../lib/get_file_name.rb'
require_relative '../lib/format_text_final.rb'
require 'date'

if(ARGV.length > 0)
    directory_name = "formatted_files_" + Date.today.to_s
    if(ARGV.include?("--save"))
        new_file = Format_text_finaly.new
        formatted_text = new_file.format_text(ARGV[0])
        puts formatted_text
        

        Dir.mkdir(directory_name) unless File.exists?(directory_name)
        File.open(directory_name + "/" + ARGV[0] + "_formatted", "w") do |file|
            formatted_text.each do |line|
                file.puts line
            end
        end
    elsif(ARGV.include?("--history"))
        Dir.each_child(directory_name) {|file| puts file}
    else
        new_file = Format_text_finaly.new
        puts new_file.format_text(ARGV[0])
        
    end
else
    puts "You seem to have forgotten to add a file to format. Add a file below:"
    file_name = gets.chomp()
    get_file(file_name)
end


