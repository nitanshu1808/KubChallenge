# Utility Helper Module for common helper methods to the RobotCleaner class
module UtilityHelper
  DIRECTIONS = {
    north: 'N',
    south: 'S',
    east: 'E',
    west: 'W',
  }.freeze

  def transform_str_into_arr_of_int(val)
    return if val.nil?

    val.scan(/\d+/).map(&:to_i)
  end

  def direction_values(vertical)
    if vertical
      [DIRECTIONS[:north], DIRECTIONS[:south]]
    else
      [DIRECTIONS[:east], DIRECTIONS[:west]]
    end
  end
end
