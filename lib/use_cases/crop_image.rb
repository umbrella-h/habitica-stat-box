require 'mini_magick'

module UseCases
  class CropImage
    def perform(filepath:, width:, height:)
      image = MiniMagick::Image.open(filepath)
      image.crop("#{width}x#{height}+0+0")
      image.write(filepath)
    end
  end
end
