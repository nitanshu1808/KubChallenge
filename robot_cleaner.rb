require_relative './utility_helper'

# Generic Robot Cleaner class for cleaning a grid with co-ordinates passed
class RobotCleaner
  include UtilityHelper
  attr_accessor :grid, :cordinates, :errors, :instructions

  def initialize(grid, *cordinates)
    @grid = transform_str_into_arr_of_int(grid)
    @cordinates = cordinates
    @errors = []
    @instructions = []
  end

  def perform
    return false unless valid?

    process_cordinates
    instructions.join('')
  end

  private

  def valid?
    errors << 'Invalid Grid Details' if height.nil? || width.nil?
    errors << 'Coordinates cannot be blank' if cordinates.empty?

    errors.empty?
  end

  def process_cordinates
    current_x = 0
    current_y = 0
    # Processing co-ordinates
    cordinates.each do |val|
      x, y = transform_str_into_arr_of_int(val)
      next unless valid_cordinates?(x, y)

      x_diff = x - current_x
      y_diff = y - current_y
      # Move horizontally
      instructions.push(moving_val(x_diff)) if x_diff != 0
      # Move vertically
      instructions.push(moving_val(y_diff, vertical: true)) if y_diff != 0
      # Clean the square-meter
      instructions << 'C' if y_diff != 0 && x_diff != 0

      current_x, current_y = x, y
    end
  end

  def height
    @height ||= (grid && grid[0].to_i)
  end

  def width
    @width ||= (grid && grid[1].to_i)
  end

  def valid_cordinates?(horizontal_cord, vertical_cord)
    horizontal_cord >= 0 && horizontal_cord < width &&
      vertical_cord >= 0 && vertical_cord < height
  end

  def moving_val(value, vertical: false)
    same_direction, opposite_direction = direction_values(vertical)

    if value.positive?
      same_direction * value
    else
      opposite_direction * value.abs
    end
  end
end
