module WorkedHoursHelper

  # Returns given number with HH:mm format.
  #
  # @param [Float] number.
  #
  # @example
  #
  #   convert_to_hours_format(0.5)  #=> 0:30
  #   convert_to_hours_format(1.25) #=> 1:15
  #   convert_to_hours_format(1)    #=> 1:00
  #
  # @return [String]
  def convert_to_hours_format(number)
    return if number.blank?

    hours_and_minutes = number.to_s.split('.')

    if hours_and_minutes.size == 1
      "#{hours_and_minutes.first}:00"
    else
      minutes = ("0.#{hours_and_minutes.second}".to_f * 60).round.to_s
      minutes = "0#{minutes}" if minutes.size == 1

      "#{hours_and_minutes.first}:#{minutes[0..1]}"
    end
  end

end
