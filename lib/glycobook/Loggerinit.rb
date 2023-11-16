require 'java'
require 'logger'
require_relative  '../jar/slf4j-api.jar'
java_import 'org.slf4j.LoggerFactory'

class JRubySLF4JLogger < Logger
  def initialize(name)
    super(STDOUT)  # STDOUTはダミー、実際のログはSLF4Jを通じて行われる
    @java_logger = LoggerFactory.getLogger(name)
  end

  def add(severity, message = nil, progname = nil)
    # Rubyのログレベルに応じてJavaのSLF4Jメソッドを呼び出す
    case severity
    when Logger::INFO
      @java_logger.info(message)
    # 他のログレベルについても同様に実装
    end
  end
end

logger = JRubySLF4JLogger.new("MyLogger")
logger.info("This is an info message from JRuby with SLF4J")
