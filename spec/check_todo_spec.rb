require 'check_todo'

RSpec.describe '#check_todo' do
  context 'string contains "#TODO"' do
    it 'returns true' do
      result = check_todo('#TODO')
      expect(result).to eq true
    end

    it 'returns true when #TODO is at the beginning of string' do
      result = check_todo('#TODO Must finish this test')
      expect(result).to eq true
    end

    it 'returns true when #TODO is at the end of a string' do
      result = check_todo('The magic word is at end of string #TODO')
      expect(result).to eq true
    end

    it 'returns true when #TODO is in middle of the string' do
      result = check_todo('Some #TODO string')
      expect(result).to eq true
    end

    it 'returns true when #TODO is inside a word' do
      result = check_todo('This should al#TODOso work too')
      expect(result).to eq true
    end
  end

  context 'string doesn\'t contain "#TODO"' do
    it 'returns false' do
      result = check_todo('something')
      expect(result).to eq false
    end

    it 'returns false when part of #TODO is missing' do
      result = check_todo('TODO this perhaps shouldn\'t work')
      expect(result).to eq false
    end

    it 'returns false when #TODO is split' do
      result = check_todo('this #TO DO shouldn\'t work either')
      expect(result).to eq false
    end
  end
end