class Definition
  attr_reader(:definition)
  @@definitions = []

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
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
