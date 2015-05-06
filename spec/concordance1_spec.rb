require "concordance1"

describe "" do 
    before do 
        @output = StringIO.new
    end
    it "takes an empty string and outputs a hash" do 
        @input = StringIO.new("")
        @output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        new_concordance.add_keys
        expect(@output.string.chomp).to eq ("{}") 
    end

    it "takes a one word string as an input and outputs the string - and a hash with string as key and value as zero" do
        @input = StringIO.new("hi")
        @output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        keys = new_concordance.add_keys
        expect(@output.string.chomp).to eq("hi")
        expect(new_concordance.build_concordance).to eq ({"hi" => [0]})
    end

   it "takes two different words and outputs the words in the string on new lines and outputs a hash wih both occurances of the word" do 
        @input = StringIO.new("hi there")
        @output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        keys = new_concordance.add_keys
        expect(@output.string.chomp).to eq("hi\nthere")
        expect(new_concordance.build_concordance).to eq ({"hi" => [0], "there" =>[3]})
    end 

    xit "takes two of the same words and outputs words on new lines and returns occurances for each word" do 
        @input = StringIO.new("hi hi")
        @output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        new_concordance.add_keys
        expect(@output.string.chomp).to eq("hi\nhi")
        expect(build_concordance("hi hi")).to eq ({"hi" => [0,3]})
    end
    xit "takes three words, two same, one different and returns occurrence each word" do 
        @input = StringIO.new("hi di hi di")
        @output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        keys = new_concordance.add_keys
        expect(@output.string.chomp).to eq("di\ndi\nhi\nhi")
        expect(build_concordance("hi di hi di")).to eq ({"hi" => [0,6], "di" => [3,9]})
    end
   
    xit "asks the user to enter text" do 
        input = StringIO.new("hi")
        output = StringIO.new
        new_concordance = Concordance.new(@input,@output) 
        new_concordance.build_concordance
        expect(@output.string.chomp).to start_with("Enter text:")
    end

    
    xit "takes a string of -hi- from the console and returns a hash" do 
        input = StringIO.new("hi")
        output = StringIO.new
        new_concordance = Concordance.new(@input,@output)
        new_concordance.build_concordance
        expect(@output.string.chomp).to end_with
    end
end

