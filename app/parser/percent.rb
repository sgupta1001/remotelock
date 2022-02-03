module Parser
  class Percent < Base
    def initialize(params)
      @percent_data = params
    end

    def parse
      people_data = []
      percent_data.each_with_index do |row_data, row_index|
        next if row_index == 0
        first_name, city, birthdate = row_data.split(' % ')
        birthdate = date_format(birthdate)
        people_data << [first_name, CITY_MAPPING[city], birthdate].join(', ')
      end
      people_data
    end

    def date_format(birthdate)
      year, month, date = birthdate.split('-').map{|number| number.to_i}
      [month, date, year].join('/')
    end

    private
    
    attr_reader :percent_data
  end
end