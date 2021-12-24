Rails.application.config.semantic_logger.application = "Test application"
Rails.application.config.rails_semantic_logger.format = :json
SemanticLogger.add_appender(io: $stdout, level: Rails.application.config.log_level, formatter: Rails.application.config.rails_semantic_logger.format)
Rails.application.config.logger.info("Application logging to STDOUT")
