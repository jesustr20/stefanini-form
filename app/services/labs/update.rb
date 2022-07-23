module Labs
  class Update
    attr_reader :labs, :attributes
    
    def initialize(labs:, attributes:)
      @attributes = attributes
      @labs = labs
    end
    
    def perform
      labs.update!(attributes) && labs
    end
  end
end