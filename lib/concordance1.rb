class Concordance

    def initialize(input,output)
        @input = input
        @output = output
    end

    def add_and_list_keys
        @text = @input.gets.to_s.split(/ /)
        if @text == ([])
            @output.puts "{}"
        else 
            @sorted_words = @text.sort
            @sorted_words.each do |word| 
                @list = "#{word}\n"
                @output.puts @list
            end
        end
    end

    def build_concordance(input)
        concordance  = {}
        position = 0 
        words = input.split(/ /)
        words.each do |word|
            if concordance[word] == nil
                concordance[word] = [position]
            else
                concordance[word] << position
            end
            position += word.length + 1
        end
        return concordance
    end

end
















#words.each do |i|
#    input.scan(/#{i}/) do |s|
#     word_index =  [s, $~.offset(0)[0]]
#    end
# end

#    return @positions.uniq



#    words.each do |word|
#         index = -1 
#        for index in 0..input.length
#            input.index(word, index+1)
#            array = @positions << index
#
#        return {("#{word}") => array}
#        end







