# This class is only to keep DCI convention
class User
  def as role
    role.new self
  end
end