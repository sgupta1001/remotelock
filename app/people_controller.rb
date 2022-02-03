class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    NormalizeService.new(params).process
  end

  private

  attr_reader :params
end
