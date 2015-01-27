require 'logger'
require 'forwardable'

module Eventbrite
  class Logger < ::Logger
    def initialize(*args)
      super
      @formatter = SimpleFormatter.new
      @level = setLevels
    end

    def setLevels
      case(ENV['LOG_LEVEL'])
      when /fatal/
        Logger::FATAL
      when /error/
        Logger::ERROR
      when /warn/
        Logger::WARN
      when /info/
        Logger::INFO
      when /debug/
        Logger::DEBUG
      else
        Logger::ERROR
      end
    end

    def deprecate(message)
      warn "[DEPRECATION]" + message
    end

    # Simple formatter which only displays the message.
    class SimpleFormatter < ::Logger::Formatter
      # This method is invoked when a log event occurs
      def call(severity, timestamp, progname, msg)
        timestamp = timestamp.strftime("%Y-%m-%d %H:%M:%S")
        "[#{timestamp}] - #{severity} - #{String === msg ? msg : msg.inspect}\n"
      end
    end
  end

  module Loggable
    def logger
      @@logger ||= Eventbrite::Logger.new(STDOUT) # TODO: replace with a real log file
    end

    def logger=(logger)
      @@logger = logger
    end

    extend Forwardable
    def_delegators :logger, :fatal, :error, :warn, :info, :debug, :deprecate
  end

  extend Loggable
end