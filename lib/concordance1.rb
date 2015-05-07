class Concordance

    def initialize(input,output)
        @input = input
        @output = output
    end

    # takes an input and calls build and produces a sorted output

    def data_input_output
        result = build(@input.gets)
         result.keys.sort.each do |word|
             @output.print word
             @output.print " #{result[word].join(",")}\n" 
         end
    end

    def build(input)
        @concordance  = {}
        position = 0 
        words = input.split(/ /)
        words.each do |word|
            if @concordance[word] == nil
                @concordance[word] = [position]
            else
                @concordance[word] << position
            end
            position += word.length + 1
        end
        return @concordance

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







