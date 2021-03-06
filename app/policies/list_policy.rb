class ListPolicy < ApplicationPolicy
  def index_api?
    user.present?
  end

  def show_api?
    user.present? && (record.permissions == "open" || record.permissions == "viewable")
  end

  def create_api?
    user.present?
  end

  def update_api?
    user.present? && (record.user == user || record.permissions == "open")
  end

  def destroy_api?
    user.present? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
