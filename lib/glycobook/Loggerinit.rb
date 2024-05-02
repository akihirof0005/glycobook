require 'java'
require 'logger'
require_relative  '../jar/slf4j-api.jar'
require_relative  '../jar/slf4j-simple.jar'

java_import 'org.slf4j.LoggerFactory'

class JRubySLF4JLogger < Logger
  def initialize(name)
    super(STDOUT)  # STDOUT is dummy
    @java_logger = LoggerFactory.getLogger(name)
  end
  def add(severity, message, progname, &block)

  message = block.call if block
  message = message.to_s

  case severity
    when 0  # Logger::DEBUG
      @java_logger.info(message)
    when 1  # Logger::INFO
      @java_logger.info(message)
    when 2  # Logger::WARN
      @java_logger.info(message)
    when 3, 4# Logger::ERROR, Logger::FATAL
      @java_logger.error(message)
    else
      @java_logger.info(message)
    end
  end
end