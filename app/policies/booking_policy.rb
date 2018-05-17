class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    # if @restaurant.user == current_user
    record.user == user
  end

  def destroy?
    record.user == user
  end


end
