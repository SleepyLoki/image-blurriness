# Class Image
class Image

  def initialize(array)
    @image_blur_array = array # Once a new object gets initialized, a parameter of an array will be expected and saved under 'image_blur_array'
  end

  # This method will locate the ones in the array given.
  def find_ones
    ones = []
    # This line will start at the beginning (upper left corner of the 2D array) so the first value, and the index of that value (i.e. [value: 0, index: 0]).
    # This will then continue on to line 17
    # Line 14 will grab the row item (0) and work along the columns. After first itiretaion (same as above since its the first index), the loop will continue until the
    # last number of the columns on that row item completes. So in this case, the three zeroes at underneath the first zero.
    # Afterwards, it will go back up to the rows line (16) and jump on to the next index and item on that row. This will continue until the entire array has been checked through.
    @image_blur_array.each_with_index do | row_item, row_index| 
      row_item.each_with_index do |col_item, col_index|
        if col_item == 1 # If the col_item (since it is the last number we checked) equals to '1', the coordinates of that number will be added onto the array 'ones'
          ones << [row_index, col_index]
        end
      end
    end
    # Returns the 'ones' array to the blur method
    return ones
  end

  def blur
    ones_coord = find_ones # Local save of the location of the '1's' in the array

    # This loop is used to debug and check to see if the locations of the '1's' are saved and correct!
    # ones_coord.each do |row|
    #   puts row.join
    # end

    # We will loop through the original array (@image_blur_array) in a similar fashion as when looking for the 1's in the array.
    @image_blur_array.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        ones_coord.each do |found_row_index, found_col_index| # We will be using the ones array (coords of the location of the 1s in the array) to compare with the original array

          # if the row/column index of the original array equals to the row/col index of the array that contains the coords of the 1's, change image
          if row_index == found_row_index && col_index == found_col_index
            @image_blur_array[row_index + 1][col_index] = 1 unless row_index == 0 #upper bounds
            @image_blur_array[row_index - 1][col_index] = 1 unless row_index >= 3 #lower bounds
            @image_blur_array[row_index][col_index - 1] = 1 unless col_index == 0 #left bounds
            @image_blur_array[row_index][col_index + 1] = 1 unless col_index >= 3 # right bounds
          end
        end
      end
    end
    puts
    puts "Image Blur #2"
    output_image
  end

  # This outputs each digit on its own line!
  # def output_image
  #   @image_blur_array.each do |row|
  #     puts row
  #   end
  # end

  # This will join each number and output them next to each other. Once row is done, a new line will print!
  def output_image
    @image_blur_array.each do |row|
      puts row.join
    end
  end
end

# New 'Image' object gets created and initialized with a provided array
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

# Outputs the results to the console -> Image Blur 1!
puts "Original Array"
image.output_image

# Outputs the results to the console -> Image Blur 2!
image.blur
