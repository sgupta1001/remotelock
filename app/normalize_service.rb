class NormalizeService
  attr_accessor :dollar_format, :percent_format, :order, :people

  def initialize params
    @dollar_format = params[:dollar_format].split(/\n/)
    @percent_format = params[:percent_format].split(/\n/)
    @order = params[:order]
    @people = []
  end

  def process
    people << Parser::Dollar.new(dollar_format).parse
    people << Parser::Percent.new(percent_format).parse
    people.flatten.sort
  end
end


