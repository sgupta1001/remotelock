require 'spec_helper'

#######################################################
# Dollar Parser Class specs#
#######################################################
RSpec.describe 'Dollar Parser specs' do
  describe 'parse' do
    let(:dollar_format) {
      File.read('spec/fixtures/people_by_dollar.txt').split(/\n/)
    }
    let(:dollar_parser) { Parser::Dollar.new(dollar_format) }

    it 'parses dollar file data' do
      dollar_parsed_data = dollar_parser.parse

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(dollar_parsed_data).to eq [
        'Rhiannon, Los Angeles, 4/30/1974',
        'Rigoberto, New York City, 1/5/1962',
      ]
    end
  end

  describe 'date_format' do
    let(:birthdate) {'30-4-1974'}
    let(:dollar_parser) { Parser::Dollar.new([]) }
    it 'returns birthdate in M/D/YYYY date_format' do
      expect(dollar_parser.send(:date_format, birthdate)).to(eq('4/30/1974'))
    end
  end
end
