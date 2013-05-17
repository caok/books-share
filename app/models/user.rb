class User < ActiveRecord::Base
  include Likeable::UserMethods
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]

  # constant
  ROLES = %w[admin member]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login
  attr_accessor :login

  # assocation
  has_many :books
  has_many :resources

  ##############
  # validation #
  ##############
  validates :name, presence: true, :uniqueness => true
  validates :email, :password, presence: true

  ######################
  # callback functions #
  ######################
  before_create :set_default_roles_for_user
  def set_default_roles_for_user
    self.roles = 'member' if self.roles_mask.blank?
  end
  private :set_default_roles_for_user

  ####################
  # instance methods #
  ####################
  def roles=(roles)
    self.roles_mask = ( [ roles ].flatten & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def any_roles?(*a)
    !(roles & a.map{|i| i.to_s}).empty?
  end

  private
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
