class BaseBehavior
  class << self
    def move state
      "Stay"
    end

    def should_act? state
      true
    end
  end
end
