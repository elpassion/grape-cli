require File.expand_path('../config/environment', __FILE__)

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Example::API.new
