def get_file file_name
    File.open(file_name).each do |line|
        puts line
    end
end