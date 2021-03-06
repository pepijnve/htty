require File.expand_path("#{File.dirname __FILE__}/../command")
require File.expand_path("#{File.dirname __FILE__}/../http_method_command")
require File.expand_path("#{File.dirname __FILE__}/http_get")
require File.expand_path("#{File.dirname __FILE__}/http_patch")
require File.expand_path("#{File.dirname __FILE__}/http_post")
require File.expand_path("#{File.dirname __FILE__}/http_delete")

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _http-put_ command.
class HTTY::CLI::Commands::HttpPut < HTTY::CLI::Command

  include HTTY::CLI::HTTPMethodCommand

  # Returns the help text for the _http-put_ command.
  def self.help
    'Issues an HTTP PUT using the current request'
  end

  # Returns related command classes for the _http-put_ command.
  def self.see_also_commands
    [HTTY::CLI::Commands::HttpGet,
     HTTY::CLI::Commands::HttpPatch,
     HTTY::CLI::Commands::HttpPost,
     HTTY::CLI::Commands::HttpDelete]
  end

end
