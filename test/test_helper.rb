ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def authenticate_with_http_basic(user = 'admin', password = 'admin')
    @request.env['HTTP_AUTHORIZATION'] = "Basic #{Base64.encode64("#{user}:#{password}")}"
  end
end
