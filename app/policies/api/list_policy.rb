class Api::ListPolicy < ApplicationPolicy
  def index
    user.present?
  end

  def show
    user.present? && (record.permissions == "open" || record.permissions == "viewable")
  end

  def create
    user.present?
  end

  def update
    user.present? && (record.user == user || record.permissions == "open")
  end

  def destroy
    user.present? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
