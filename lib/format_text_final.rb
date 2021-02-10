require_relative "utility_helper_functions"
class Format_text_finaly
    def format_text file_name
        file_contents = [];

        File.open(file_name).each do |line|
            file_contents << line.to_s;
        end
        file_contents = space_reducer(file_contents)
        check_line_length(file_contents)
        file_contents = blank_remover(file_contents)
        # puts file_contents
        return file_contents
    end

    def check_line_length file_contents
        line_count = file_contents.length;
        lines_observe = 0;
        
        while lines_observe < line_count do
            if(file_contents[lines_observe].to_s.length > 80)
                file_contents = adjust_lines(file_contents, lines_observe, lines_observe + 1)
                line_count = file_contents.length;
            end
            lines_observe += 1;
        end
        return file_contents
        # print file_contents
    end

    #Finds out what changes need to be made for formating then adjust the lines and returns a new file content with the updated changes.


    def adjust_lines (file_contents, first_line_idx, second_line_idx)
        #adjust two lines and mode
        mode = -1;

        #should keep the first 80 char on the curr line and move the rest to the next line
        if(file_contents[first_line_idx][79] === " " || file_contents[first_line_idx][80] === " ")
            mode = 0;
            # puts mode
        elsif(file_contents[first_line_idx][79] != " " && file_contents[first_line_idx][80] != " " && file_contents[first_line_idx].include?(" "))
            mode = 1
            # puts mode
        elsif(!file_contents[first_line_idx].include?(" "))
            mode = 2;
            # puts mode
        end

        case mode
        when 0
            Utility_helper_functions.new.mode_0(file_contents, first_line_idx, second_line_idx)
        when 1
            Utility_helper_functions.new.mode_1(file_contents, first_line_idx, second_line_idx)
        when 2
            Utility_helper_functions.new.mode_2(file_contents)
        else
            puts "no case are matched"
        end
    end

    def space_reducer file_contents
        for lines in (0..(file_contents.length - 1)) do 
            file_contents[lines] = file_contents[lines].to_s.squeeze(" ")
            file_contents[lines] = file_contents[lines].to_s.gsub("\n", "")
        end
        return file_contents
    end

    def blank_remover file_contents
        line_count = file_contents.length;
        lines_observe = 0;
        
        while lines_observe < line_count do
            # puts "start here"
            # puts lines_observe
            if(file_contents[lines_observe] === "" && file_contents[lines_observe + 1] === "" )
                file_contents.delete_at(lines_observe)
                blank_remover(file_contents)
            end
            if(file_contents[-1] === "")
                file_contents.delete_at(-1)
            end

            if(file_contents[0] === "")
                file_contents.delete_at(0)
            end
            lines_observe += 1
        end
        return file_contents
    end
end
#mode 0 = char 79 is a space and we just take 80.. -1 and move it on the next line. 
#mode 1 = char 79 is in the middel of a word and we need to find the last space.
#mode 2 = all of the lines are 81 plus and needs to make a new line at the bottom.