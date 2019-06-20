# Class Image
class Image

  def initialize(array)
    @image_blur_array = array # Once a new object gets initialized, a parameter of an array will be expected and saved under 'image_blur_array'
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

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image