require 'yaml'
require './session.rb'

class SessionRepo

  $save_file_name = "session.txt"

  public

  def save(session)
    File.open($save_file_name, "w") do |file|
      file.write(session.to_yaml)
    end
  end

  def restore
    session = nil

    # Get previous session
    begin
      File.open($save_file_name, "r") do |file|
        session = YAML.load(file.read)
      end
    rescue
      puts "No previous sessions available to restore."
    end

    # Delete previous session
    File.delete($save_file_name)

    session
  end
end