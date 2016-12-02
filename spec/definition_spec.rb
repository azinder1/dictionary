require('rspec')
require('pry-nav')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
    @definition1 = Definition.new(:definition_sentence => "To delibrately sneeze in public to bring attention to onseself")
    @definition1.save()

    @definition2 = Definition.new(:definition_sentence => "An object that is awkward to carry on one's back")
    @definition2.save()

  end

  describe('#initialize') do
    it('can retrieve information for new definition') do
      expect(@definition1.definition_sentence()).to eq("To delibrately sneeze in public to bring attention to onseself")
    end
  end
  describe('#find') do
    it('can find a unique id definition from definitions array') do
      expect(Definition.find(@definition2.id())).to eq(@definition2)
    end
  end
end
