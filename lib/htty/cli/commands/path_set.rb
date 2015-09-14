require File.expand_path("#{File.dirname __FILE__}/../command")
require File.expand_path("#{File.dirname __FILE__}/../url_escaping")
require File.expand_path("#{File.dirname __FILE__}/address")

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _path-set_ command.
class HTTY::CLI::Commands::PathSet < HTTY::CLI::Command

  include HTTY::CLI::UrlEscaping

  # Returns the name of a category under which help for the _path-set_ command
  # should appear.
  def self.category
    'Navigation'
  end

  # Returns the arguments for the command-line usage of the _path-set_ command.
  def self.command_line_arguments
    'PATH'
  end

  # Returns the help text for the _path-set_ command.
  def self.help
    "Changes the path of the request's address"
  end

  # Returns the extended help text for the _path-set_ command.
  def self.help_extended
    'Changes the path used for the request. Does not communicate with the ' +
    "host.\n"                                                               +
    "\n"                                                                    +
    "The path will be URL-encoded if necessary.\n"                          +
    "\n"                                                                    +
    'The console prompt shows the address for the current request.'
  end

  # Returns related command classes for the _path-set_ command.
  def self.see_also_commands
    [HTTY::CLI::Commands::Address]
  end

  # Performs the _path-set_ command.
  def perform
    add_request_if_new do |request|
      self.class.notify_if_cookies_cleared request do
        path = arguments[0]
        path_components = path.split('/')
        escaped_components = escape_or_warn_of_escape_sequences(path_components)
        escaped_path = escaped_components.join('/')
        request.path_set(escaped_path)
      end
    end
  end

end
