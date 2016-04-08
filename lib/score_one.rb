module Scoring

  class Word
    attr_reader :word, :score

    def initialize(word)
      @word = Scoring.process_word(word)
      @score = Scoring.score(@word)
    end
  end

  class Words
    attr_reader :many, :score
    def initialize(words)
      @many = words
      @score = Words.score(@many)
    end

    def self.score(words)
      many = []
      array = words.split(' ')
      array.each do |word|
        word = Scoring.process_word(word)
        score = Scoring.score(word)
        many << "#{word}" + " is worth " + "#{score}" + " points."
      end
      index = 0
      many.each do
        puts many[index]
        index += 1
      end
    end
  end

  class Scoring
      SCORE_CHART = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10
    }

    # Take a word, upcase it, and return an array of its letters
    def self.process_word(word)
      word.gsub(/[^a-zA-Z]/, '')
    end

    def self.word_letters(word)
      process_word(word)
      word.upcase.split(//)
    end

    # Finds the point value of each letter given
    def self.letter_points(letter)
      SCORE_CHART.fetch(letter)
    end

    # Finds point value of each letter in a word
    # Creates an array of points for each letter
    def self.word_points(word)
      word_letters(word).map { |i| letter_points(i) }
    end

    # Sums the points from the word_points array
    def self.score(word)
      total = 0
      # Adds a bonus for 7-letter words.
      if word_points(word).length >= 7 then total = 50 end
      total += word_points(word).reduce(:+)
      total
      #=> Fixnum score of word Ex: if word = "dumpling" returns 14
    end
  end
end
