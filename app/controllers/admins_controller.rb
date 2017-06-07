class AdminsController < ApplicationController
  if current_user.admin?
    # do something
  end

  if current_user.try(:admin?)
    # do something
  end
end


# current_user.update_attribute :admin, true
