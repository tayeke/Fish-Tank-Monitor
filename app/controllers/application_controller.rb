class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    http_basic_authenticate_with name: "fish", password: ENV.fetch('BASIC_SECRET', 'unsecure')
end
