class UserRole < DelegateClass(User)
  delegate :id, :nil?, :to => :__getobj__

  def user
    __getobj__
  end
end