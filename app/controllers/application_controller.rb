class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  add_flash_types :danger, :info, :warning, :success
end
