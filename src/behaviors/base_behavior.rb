class BaseBehavior
  def initialize state
    @state = state
  end

  def move
    "Stay"
  end

  def should_act?
    true
  end
end
