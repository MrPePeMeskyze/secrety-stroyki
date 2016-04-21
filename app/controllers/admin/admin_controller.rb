class Admin::AdminController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "secret"
  include ApplicationHelper
  before_action :session_start
  layout "admin/layouts/admin"
end