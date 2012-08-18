MongoMapper.connection = Mongo::Connection.new(logger: Rails.logger)
MongoMapper.database   = "hd-#{Rails.env}"
