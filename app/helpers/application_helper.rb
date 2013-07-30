module ApplicationHelper

  # If given value is nil returns a None text otherwise executes given block.
  def show_unless_nil(value)
    if value.blank?
      'None'
    else
      yield and nil
    end
  end

  def current_user
    @user
  end

end
