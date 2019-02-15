class User < ApplicationRecord
    has_many :roles
    self.per_page = 10

end
