# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles_mask             :integer
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]

  # constant
  ROLES = %w[admin member]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login, :avatar, :avatar_cache
  attr_accessor :login
  
  # load carrierwave 
  mount_uploader :avatar, ImageUploader

  # assocation
  has_many :books
  has_many :resources
  acts_as_follower

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
