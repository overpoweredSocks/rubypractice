# a simple script for analyzing the english grammar of a txt file
# the output is recorded to std.out

STOP_WORDS = %w{the a by on for of are with just but and to the my I has
    some in}

# computing count attributes of the txt		
lines = File.readlines(ARGV.first)
line_count = lines.size
text = lines.join
total_characters = text.length
text_no_spaces = text.gsub(/\s+/, "")
non_ws_characters = text_no_spaces.length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
key_words = text.scan(/\w+/).select { |word| !STOP_WORDS.include?(word) }

# summmary computation
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sorted_sentences = sentences.sort_by { |sentence| sentence.length }
one_third_range = sorted_sentences.length / 3
ideal_sentences = sorted_sentences.slice(one_third_range, 
    one_third_range + 1).select { |sentence| sentence =~ /is|are/ }
    
puts "Welcome to the txt file analyzer!"
puts "Here are the stats for #{ARGV.first}"
puts
puts "There are #{line_count} lines."
puts "There are #{total_characters} total characters."
puts "There are #{non_ws_characters} characters excluding spaces."
puts "There are #{word_count} total words."
puts "There are #{sentence_count} sentences."
puts "There are #{paragraph_count} paragraphs."
puts "There are #{(sentence_count.to_f / paragraph_count).round(3)} sentences per paragraph."
puts "There are #{(word_count.to_f / sentence_count).round(3)} words per sentence."
puts "#{((key_words.length.to_f / word_count) * 100).to_i}% of words are non-fluff words." 
puts "Summary: "
puts

puts ideal_sentences.join(".  ")







