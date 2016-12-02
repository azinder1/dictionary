class Definition
  attr_reader(:definition_sentence, :part_of_speech)
  @@definitions = []

  def initialize(attributes)
    @definition_sentence = attributes.fetch(:definition_sentence)
    @part_of_speech = attributes.fetch(:part_of_speech)
    @id = @@definitions.length + 1
  end

  def id
    @id
  end

  def self.all
    @@definitions
  end

  def save
    @@definitions.push(self)
  end

  def self.clear
    @@definitions = []
  end

  def self.find(id)
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(id.to_i())
          found_definition = definition
      end
    end
    found_definition
  end
end
