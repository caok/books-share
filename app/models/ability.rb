class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ? user : User.new
    @user ? user_rules : guest_rules
  end

  def user_rules
    @user.roles.each { |role| send("#{role}_rules") }
    default_rules
  end

  def admin_rules
    can :manage, :all
  end

  def member_rules
    can :read, :all
    can :create, [Book, Resource]
    can :manage, Attachment
    can [:update, :destroy], Book do |book|
      book.user_id == @user.id
    end
    can :destroy, Resource do |resource|
      resource.user_id == @user.id
    end
    can [:auto_create, :auto_new], Book
  end

  def guest_rules
  end

  def default_rules
    can :read, :all
  end
end
