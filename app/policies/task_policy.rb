class TaskPolicy < ApplicationPolicy

  def index?
    user.present?
  end

end