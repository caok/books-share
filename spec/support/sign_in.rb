module ValidUserHelper
  def sign_in_with_valid_user user=nil
    user ||= Factory.create :user
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :controller
end
