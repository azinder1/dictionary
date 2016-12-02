class Word
  attr_reader(:word_name)
  @@words = []

  def initialize(attributes)
    @word_name = attributes.fetch(:word_name).capitalize
    @id = @@words.length + 1
    @word_definition = []
  end

  def word_definition
    @word_definition
  end

  def id
    @id
  end

  def self.all
    @@words
  end

  def self.sort_word
    @@words.sort! do |a, b|
      a.word_name <=> b.word_name
    end
  end

  def save
    @@words.push(self)
  end

  def self.clear
    @@words = []
  end

  def add_word_definition(definition)
    @word_definition.push(definition)
  end

  def self.find(id)
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id.to_i())
        found_word = word
      end
    end
    found_word
  end
end
