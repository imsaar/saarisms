# This script goes through the given folder of images and intelligently rotates
# images that need rotation. This script requires rmagick library installed
require 'rmagick'
require 'exifr'
require 'pp'

ROTATE_CLOCKWISE = 90
ROTATE_ANTICLOCKWISE = -90

def rotate(file)
  image_exif = EXIFR::JPEG.new(file).exif

  puts "#{file} : #{image_exif[:orientation]}"
  if (image_exif[:orientation] == EXIFR::TIFF::RightTopOrientation)
    degrees = ROTATE_CLOCKWISE
  elsif (image_exif[:orientation] == EXIFR::TIFF::LeftBottomOrientation)
    degrees = ROTATE_ANTICLOCKWISE
  else
    puts "Not rotating #{file}"
    return
  end

  image = (Magick::Image.read(file)).first
  #image.rotate(degrees).write("#{file.split('.').first}_rotated.jpg")
  image.rotate(degrees).write("#{file}")
end

dir = ARGV[0]

Dir.entries(dir).each do |file|
  if (file =~ /jpg/i)
    rotate(File.join(dir, file))
  end
end
