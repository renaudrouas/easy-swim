class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:home,]
  layout "home_layout", :only => [ :home ]
  #special layout pour la home, ne pas toucher merci.
  def home
  end
end
