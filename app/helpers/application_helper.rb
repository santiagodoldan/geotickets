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

  def start_week_date
    week_date.beginning_of_week
  end

  def end_week_date
    week_date.end_of_week - 2.days
  end

  def current_week_range
    start_week_date..end_week_date
  end

  def active_by_today_or_index(day, index)
    if current_week_range.cover?(Date.today)
      'active' if day.today?
    else
      'active' if index == 0
    end
  end

  private

  def week_date
    params[:week_date].try(:to_date) || Date.today
  end

end
