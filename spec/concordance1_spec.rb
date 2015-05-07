require "concordance1"

describe "" do 
    before do 
        @output = StringIO.new
    end
    it "takes an empty string and outputs a hash" do 
        @input = StringIO.new("")
        concordance.add_and_list_keys
        expect(@output.string.chomp).to start_with("{}") 
    end

    it "takes a one word string and creates a hash with string as key and value as zero" do
        @input = StringIO.new("hi")
        expect(concordance.build_concordance("hi")).to eq ({"hi" => [0]})
    end

   it "takes two different words and outputs a hash wih both occurances of the word" do 
        @input = StringIO.new("hi there")
        expect(concordance.build_concordance("hi there")).to eq ({"hi" => [0], "there" =>[3]})
    end 

    it "takes two of the same words and returns occurances for each word" do 
        @input = StringIO.new("hi hi")
        expect(concordance.build_concordance("hi hi")).to eq ({"hi" => [0,3]})
    end
    it "takes three words, two same, one different and returns occurrence each word" do 
        @input = StringIO.new("hi di hi di")
        expect(concordance.build_concordance("hi di hi di")).to eq ({"hi" => [0,6], "di" => [3,9]})
    end
   
    it "takes a string of -hi- from the console and returns the word" do 
        @input = StringIO.new("hi")
        concordance.add_and_list_keys
        expect(@output.string.chomp).to end_with("hi")
    end

    it "takes a string of -hi di hi di- from the console and returns an alphabetically ordered list of the words" do
    @input = StringIO.new("hi di hi di")
    concordance.add_and_list_keys
    expect(@output.string.chomp).to eq("di\ndi\nhi\nhi")
end
   def concordance
       Concordance.new(@input,@output)
   end
end
