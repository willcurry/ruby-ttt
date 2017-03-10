require 'computer_vs_computer'
require 'modes' if File.exist?("modes.rb") 

class ModeRegistry
  def initialize(game_type)
    @game_type = game_type
    @modes = ModeRegistry.all_modes
  end

  def find(key)
    mode = @modes.find {|mode| mode.key == key}
  end

  def self.all_modes
    modes = []
    Modes.constants.each do |mode|
      modes << get_class(mode)
    end
    modes.sort_by {|mode| mode.key}
  end
  
  private

  def self.get_class(mode)
    Object.const_get("Modes::#{mode}").new
  end
end
