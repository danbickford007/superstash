require "superstash/version"

module Superstash

  PATH = File.expand_path File.dirname(__FILE__)

  def hello
    create_stashes_if_missing
    puts "-" * 99
    puts "SuperStashing..."
    puts "-" * 99
  end

  def create_stashes_if_missing
    if !Dir.exist? "#{PATH}/stashes"
      Dir.mkdir "#{PATH}/stashes"
    end
  end

  def add_message
    puts 'Add a message to identify this stash'
    message = gets
    list = Dir.entries "#{PATH}/stashes"
    Dir.mkdir "#{PATH}/stashes/stash-#{list.count}"
    File.open("#{PATH}/stashes/stash-#{list.count}/message", 'w') { |file| file.write(message) }
  end
end
