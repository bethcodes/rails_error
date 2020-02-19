class ApplicationController < ActionController::Base
  def default
    render file: "public/index.html", layout: false
  end
end
