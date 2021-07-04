describe 'the program' do
  it 'has a file app.rb' do
    expect(File).to exist("app.rb")
  end

  it 'outputs the string "Hello World!" using the puts method' do
    # load 'app.rb' will run the code in the app.rb file
    # \n represents a newline character (remember, puts will include a line break at the end of the string)
    # stdout represents the output of your program
    expect { load 'app.rb' }.to output(a_string_including("Hello World!\n")).to_stdout
  end

  it 'outputs the string "Pass this test, please." using the print method' do
    expect { load 'app.rb' }.to output(a_string_including("Pass this test, please.")).to_stdout
  end

  it 'outputs the array [1, 2, 3] using the p method' do
    expect { load 'app.rb' }.to output(a_string_including("[1, 2, 3]\n")).to_stdout
  end
end
