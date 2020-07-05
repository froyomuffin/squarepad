require "bundler/setup"

require_relative "squarepad.rb"


SOURCE_DIR = 'source'
task :pad_all do
  image_file_names = Dir.glob("#{SOURCE_DIR}/*")
  image_file_names.each do |image_file_name|
    puts "Padding #{image_file_name}"
    SquarePad.pad!(image_file_name)
  end
end

