# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, UserInfo, user: user


    return unless user.present?

    can :read, UserInfo
    can :update, UserInfo, user: user
  end
end
