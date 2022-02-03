module Parser
  class Dollar < Base
    def initialize(params)
      @dollar_data = params
    end

    def parse
      people_data = []

      dollar_data.each_with_index do |row_data, row_index|
        next if row_index == 0
        city, birthdate, last_name, first_name = row_data.split(' $ ')
        birthdate = date_format(birthdate)
        people_data << [first_name, CITY_MAPPING[city], birthdate].join(', ')
      end
      people_data
    end

    private
    
    def date_format(birthdate)
      date, month, year = birthdate.split('-').map{|number| number.to_i}
      [month, date, year].join('/')
    end
    
    attr_reader :dollar_data
  end
end