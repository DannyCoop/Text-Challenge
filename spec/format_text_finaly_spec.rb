require 'format_text_final'

RSpec.describe Format_text_finaly do
    file = Format_text_finaly.new
    space_test = ["asdasd   dasdasd",  "asdasddasdad    sdasdasdasda   asdasd", "dasd asd as ada sdadasda    sdasdsdasdasdasdasd a"]
    blank_line_test = ["Let's get rid of the next 3 empty spaces.", "", "", "", "", "Nice now there is only one line break"]
    adjust_line_test = ["This is the mode zero test this test should check out what happens if char 79 & 80 is a space. ", "The expected! outcome is it cuts off perfectly"]
    check_line_length_test = ["This is the mode zero test this test should check out what happens if char 79 & 80 is a space. ", "The expected! outcome is it cuts off perfectly. ", "This is mode one this test should break the line on the closest previous space when char 79 is", " in the middle of a word."]

    context "The space_reducer method is called with array of file lines." do
        it "It reduces consecutive spaces in the lines strings." do
            expect(file.space_reducer(space_test)).to eq(["asdasd dasdasd",  "asdasddasdad sdasdasdasda asdasd", "dasd asd as ada sdadasda sdasdsdasdasdasdasd a"])
        end
    end

    context "The blank_line removing method is called with an array of file lines." do
        it "It should remove all the extra blank lines in between the paragraphs." do
            expect(file.blank_remover(blank_line_test)).to eq(["Let's get rid of the next 3 empty spaces.", "", "Nice now there is only one line break"])
        end
    end

    context "The adjust_lines method is called with an array of file lines and two indexs." do
        it "It should determine what mode to use then call that method." do
            expect(file.adjust_lines(adjust_line_test, 0, 1)).to eq(["This is the mode zero test this test should check out what happens if char 79 & ", "80 is a space. The expected! outcome is it cuts off perfectly"])
        end
    end

    context "The check_line_length method takes in a array if file lines." do
        it "It checks each line to see if it exceeds 80 characters. If they exceed 80 characters then we call the adjust_lines method and updates the file contents based on what is returned." do
            expect(file.check_line_length(check_line_length_test)).to eq(["This is the mode zero test this test should check out what happens if char 79 & ", "80 is a space. The expected! outcome is it cuts off perfectly. ", "This is mode one this test should break the line on the closest previous space ", "when char 79 is in the middle of a word."])
        end
    end

    context "The format_text_method takes a file name/path." do
        it "It reads the file and populates an array with the lines in side the file. Then uses the space_reducer, check_line_length, and blank_remover function to get a final product." do
            expect(file.format_text("format_text_test.txt")).to eq(["Vivamus laoreet tellus et urna vulputate, id congue dui pulvinar. Sed blandit ", "urna ut tincidunt imperdiet, lectus ligula rhoncus felis, vulputate aliquam ", "lectus eros ac ante. Quisque egestas nisi vel viverra vulputate. Quisque ", "hendrerit, augue non semper malesuada, velit massa imperdiet augue, et viverra ", "lorem velit ac orci. ", "", "the next paragraph is here one line away"])
        end
    end
end