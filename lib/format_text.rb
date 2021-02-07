def format files
    file_number = 0;
    to_next_line = "";
    last_space = "";
    arr = [];

    #loops through the files
    files.each do |file|
        puts "========================================"
        #Loops through file lines
        File.open(file).each do |line|
            # # line.prepend(to_next_line)
            # # puts to_next_line + line
            testing = line.slice(0..-1)
            puts testing
            # testingtwo = to_next_line + testing
            # puts testingtwo
            # puts to_next_line.class
            to_next_line = "";
            if(line.length > 80)
                if(line[79] === " ")
                    # puts "if ran"
                    to_next_line = line.slice(80..-1)
                    arr << line.slice(0..79)
                elsif(line[79] != " ")
                    # puts "else ran"
                    last_space = line.slice(0..79)
                    x = false;
                    y = last_space.split("")
                    count = -1
                    for i in (0..(y.length - 1)).reverse_each
                        if(y[i] === " ")
                            arr << line.slice(0..i);
                            to_next_line = line.slice((i + 1)..-1);
                        end
                    end
                end
            else
                # puts "This is : " + line
                arr << line
            end
            # print "* " + last_space + " *" 
            # puts line
        end
        arr.each do |line|
            # puts line
        end
        puts "========================================"
        puts "file " + file_number.to_s + " has been formated."
        # file.close
    end
end