module Labs
  class List
    SORT = 'labname desc'.freeze
    attr_reader :query
    
    def initialize(options:)
      @query = options[:q]
    end
    
    def perform
      res = Lab.ransack(query)
      res.sorts = SORT if res.sorts.empty?
      res.result(distinct: true)
    end
  end
end