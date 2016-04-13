class Admin::AdminController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "secret"

  layout "admin/layouts/admin"
end