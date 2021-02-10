# Text Formatter!
Text formatter is a .txt formating CLI applecation that was developed in ruby.

# Prequisites
Before you begin , ensure you have met the following requirements:

 - You have installed ruby 2.7.0p0
 - You have installed bundler
 - you have a Mac machine.
 
# Installing Text Formatter
To install Text Formatter, follow these steps:
 - Download/clone Text Formatter
 - Then run `bundle install` to install the testing libary rspec
 
# Using Text Formatter
Text Formatter has three commands `basic` , `save`, and `history`.
- `basic`will take in a file and output the file reformatted. You can do this but following the example below:
`ruby .bin/format-text.rb <filename.txt>`

- `save`takes in a file and outputs the file reformatted just like basic, but when we add the `--save`flag it now create a folder marked with the date that we will store all the files we save on that date. You can do this but following the example below:
 `ruby .bin/format-text.rb <filename.txt> --save`
 - `history`will display the names of all files you saved that day.
 `ruby .bin/format-text.rb --history`
 
# Using RSpec Test
If you followed along with the `Installing Text Formatter`section you should already have `rspec` installed. But just in case you didn't, run `bundle install` and that should take care of it.  To run the test follow the instructions below:

- You can run `rspec`and run all the test at once.
- You can run `rspec <spec_file_name.rb>`
- you can also do rspec <spec_file_name>.rb --next-failure`so you only see one failing test at a time.

Right now most of the test are using smaller test sample that are set up to test a specific cases. If you want to change the test case then you'll need to change the corresponding array.