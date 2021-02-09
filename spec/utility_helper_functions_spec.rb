require 'utility_helper_functions'

RSpec.describe Utility_helper_functions do
    file = Utility_helper_functions.new

    mode_0_test = ["This is the mode zero test this test should check out what happens if char 79 & 80 is a space. ", "The expected! outcome is it cuts off perfectly"]
    mode_0_1_line_test = ["This is the mode zero test this test should check out what happens if char 79 & 80 is a space. The expected! outcome is it cuts off perfectly"]
    mode_1_test = ["This is mode one this test should break the line on the closest previous space when char 79 is", " in the middle of a word."]
    mode_1_1_line_test = ["This is mode one this test should break the line on the closest previous space when char 79 is in the middle of a word."]
    mode_2_test = ["stayasonewordstayasonewordstayasonewordstayasonewordstayasonewordstayasonewordstasdaad"]

    context "The mode_zero_method is called with an array of file lines and two indexes." do
        it "It takes lines that are grater then 80 characters and send all characters after 80 to the nextline." do
            expect(file.mode_0(mode_0_test, 0, 1)).to eq(["This is the mode zero test this test should check out what happens if char 79 & ", "80 is a space. The expected! outcome is it cuts off perfectly"])
        end
        it "It should move all characters pass 80 to a new line." do
            expect(file.mode_0(mode_0_1_line_test, 0, 1)).to eq(["This is the mode zero test this test should check out what happens if char 79 & ", "80 is a space. The expected! outcome is it cuts off perfectly"])
        end
    end

    context "The mode_one_method is called with a array of file lines and two indexs." do
        it "It break the line on the closest previous space and adds the remaining of the characters to the next line." do
            expect(file.mode_1(mode_1_test, 0, 1)).to eq(["This is mode one this test should break the line on the closest previous space ", "when char 79 is in the middle of a word."]) 
        end

        it "It break the line on the closest previous space and adds the remaining characters to a new line" do
            expect(file.mode_1(mode_1_1_line_test, 0, 1)).to eq(["This is mode one this test should break the line on the closest previous space ", "when char 79 is in the middle of a word."])
        end
    end

    context "The mode_two_method is called with arrary of file lines." do
        it "It leaves words larger than 80 characters instact." do
            expect(file.mode_2(mode_2_test)).to eq(["stayasonewordstayasonewordstayasonewordstayasonewordstayasonewordstayasonewordstasdaad"])
        end
    end
end