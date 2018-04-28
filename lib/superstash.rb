require "superstash/version"

module Superstash
  def hello
    puts "-" * 99
    puts "SuperStashing..."
    puts "-" * 99
  end

  def add_message
    puts 'Add a message to identify this stash'
    message = gets
    File.open("#{File.expand_path File.dirname(__FILE__)}/stashes/mystash", 'w') { |file| file.write(message) }
  end
end
