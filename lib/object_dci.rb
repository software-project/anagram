class ActiveRecord::Base
  def as role
    role.new self
  end
end

class NilClass
  def as role
    role.new self
  end
end

class Class
  def as role
    role.new self
  end
end