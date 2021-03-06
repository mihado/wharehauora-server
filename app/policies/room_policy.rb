class RoomPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def show?
    owner? || whanau?
  end

  def update?
    owner?
  end

  def destroy?
    owner? || janitor?
  end

  private

  class Scope < Scope
    def resolve
      return janitor_scope if janitor?
      return user_scope if user.present?
      public_scope
    end

    private

    def janitor?
      user.present? && user.role?('janitor')
    end

    def janitor_scope
      scope.all
    end

    def user_scope
      scope.joins(:home)
           .joins('LEFT OUTER JOIN home_viewers ON homes.id = home_viewers.home_id')
           .where('(homes.owner_id = ? OR home_viewers.user_id = ?)', user.id, user.id)
    end

    def public_scope
      scope.joins(:home).where(homes: { is_public: true })
    end
  end

  def owner?
    record.home.owner_id == user.id
  end

  def whanau?
    record.home.users.include? user
  end
end
