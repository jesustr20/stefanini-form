module Labs
  class Destroy
    attr_reader :labs
    
    def initialize(labs:)
      @labs = labs
    end
    
    def perform
      labs.destroy
    end
  end
end