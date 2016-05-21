class BaseBot
  attr_writer :behaviors

  def update new_state
    @state = new_state
  end

  def move
    behaviors.find { |b| b.should_act? @state }.move @state
  end

  def behaviors
    [
      BaseBehavior,
    ]
  end
end
