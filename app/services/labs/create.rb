module Labs
  class Create
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def perform
      Lab.create!(attributes)
    end
  end
end