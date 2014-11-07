class UserPolicy < ApplicationPolicy
  def index
    user.present?
  end

  def show
    user.present? && record.id == user.id
  end

  def create
    true
  end

  def update
    user.present? && record.id == user.id
  end

  def destroy
    user.present? && record.id == user.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
