class Utility_helper_functions
    def mode_0 (file_contents, first_line_idx, second_line_idx)
        if(file_contents[second_line_idx] === "" && file_contents[second_line_idx + 1] != "")
            file_contents.insert(second_line_idx, "")
            file_contents[second_line_idx] = file_contents[first_line_idx].slice(80..-1).concat(file_contents[second_line_idx].to_s);
            file_contents[first_line_idx] = file_contents[first_line_idx].slice(0..79);
        else
            file_contents[second_line_idx] = file_contents[first_line_idx].slice(80..-1).concat(file_contents[second_line_idx].to_s);
            file_contents[first_line_idx] = file_contents[first_line_idx].slice(0..79);
        end
        return file_contents
    end

    def mode_1 (file_contents, first_line_idx, second_line_idx)
        for i in (0..79).reverse_each
            if(file_contents[first_line_idx][i] === " ")
                if(file_contents[second_line_idx] === "" && file_contents[second_line_idx + 1] != "")
                    file_contents.insert(second_line_idx, "")
                    file_contents[second_line_idx] = file_contents[first_line_idx].slice((i + 1)..-1).concat(file_contents[second_line_idx].to_s)
                    file_contents[first_line_idx] = file_contents[first_line_idx].slice(0..i)
                    return file_contents
                else
                    file_contents[second_line_idx] = file_contents[first_line_idx].slice((i + 1)..-1).concat(file_contents[second_line_idx].to_s)
                    file_contents[first_line_idx] = file_contents[first_line_idx].slice(0..i)
                    return file_contents
                end
            end
        end
    end

    def mode_2 (file_contents)
        return file_contents
    end
end
