class PagesController < ApplicationController
  layout "home_layout", :only => [ :home ]
  def home
  end
end
