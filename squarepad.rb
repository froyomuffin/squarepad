require "bundler/setup"

require "rmagick"

include Magick

class SquarePad
  def self.pad!(image_file_name, pad_percentage = 10)
    image = ImageList.new(image_file_name).first

    width = image.columns
    height = image.rows

    longer_length, shorter_length, longer_side = 
      if width > height
        [width, height, :width]
      else
        [height, width, :height]
      end

    padded_length = longer_length * (100 + pad_percentage) / 100

    longer_padding = (padded_length - longer_length) / 2
    shorter_padding = (padded_length - shorter_length) / 2

    width_padding, height_padding =
      if (longer_side == :width)
        [longer_padding, shorter_padding]
      else
        [shorter_padding, longer_padding]
      end

    image
      .border(width_padding, height_padding, 'white')
      .write(image_file_name) { self.quality = 100 }
  end
end
