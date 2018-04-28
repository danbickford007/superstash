require "superstash/version"
require 'fileutils'

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
    create_current_stash message
    stash_current_project
  end

  def create_current_stash message
    Dir.mkdir new_stash
    File.open("#{current_stash}/message", 'w') { |file| file.write(message) }
  end

  def stash_current_project
    Dir.mkdir "#{current_stash}/project/" 
    FileUtils.cp_r Dir.pwd, "#{current_stash}/project/"
  end

  def new_stash
    "#{PATH}/stashes/stash-#{stashes.count + 1}"
  end

  def current_stash
    "#{PATH}/stashes/stash-#{stashes.count}"
  end

  def stashes
    Dir.entries("#{PATH}/stashes").reject{|x| ['.', '..'].include? x}
  end

  def list
    puts 'Current available stashes:'
    begin
      stashes.each do |stash|
        puts stash 
      end
    rescue
      puts "No stashes available. Hint: type `ss` in your project directory to create a superstash"
    end
  end
end
