# Quick script to bulk prepend prefix to filenames to all files in a directory
# Also strips any spaces in the filename
# Example usage : ruby prepend_rename.rb Disc1_ C:\AudioBook\Disc1\

raise "Prefix and Directory are required" if ARGV.size < 2

prefix = ARGV[0]
dir = ARGV[1]

raise "Non-word character prefix #{prefix}" unless prefix =~ /^\w+$/
raise "No such directory: #{dir}" unless Dir.exists?(dir)

Dir.chdir(dir)
Dir.entries(dir).each do |file|
 next if File.directory?(file)
 new_name = prefix + file.gsub(/\s+/, '')
 File.rename(file, new_name)
end
