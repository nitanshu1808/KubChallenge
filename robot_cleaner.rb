require_relative './utility_helper'

# Generic Robot Cleaner class for cleaning a grid with co-ordinates passed
class RobotCleaner
  include UtilityHelper
  attr_accessor :grid, :cordinates, :errors, :instructions

  def initialize(grid, *cordinates)
    @grid = transform_str_into_arr_of_int(grid)
    @cordinates = cordinates
    @errors, @instructions = [], []
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
    current_horizontal_cord, current_vertical_cord = 0, 0
    # Processing co-ordinates
    cordinates.each do |val|
      horizontal_cord, vertical_cord = transform_str_into_arr_of_int(val)
      next unless valid_cordinates?(horizontal_cord, vertical_cord)

      horizontal_cord_diff = horizontal_cord - current_horizontal_cord
      vertical_cord_diff = vertical_cord - current_vertical_cord

      instructions.push(*[
        generate_movement_instructions(horizontal_cord_diff), # Move horizontally
        generate_movement_instructions(vertical_cord_diff, vertical: true), # Move vertically
        'C' # Clean the square-meter
      ].compact)

      current_horizontal_cord, current_vertical_cord = horizontal_cord, vertical_cord
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

  def generate_movement_instructions(value, vertical: false)
    return if value == 0

    same_direction, opposite_direction = direction_values(vertical)

    if value.positive?
      same_direction * value
    else
      opposite_direction * value.abs
    end
  end
end
