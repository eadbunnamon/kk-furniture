class Ability
  include CanCan::Ability

  # def initialize(user = User.new)

  #   # Anyone
  #   can :manage, :password_reset
  #   if user.admin?
  #     can    :manage,             :all
  #   end
  # end
end
