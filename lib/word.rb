class Word
  attr_reader(:word)
  @@words = []

  def initialize(attributes)
    @word = attributes.fetch(:word)
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