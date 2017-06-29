class User < ApplicationRecord
    enum user_roles: { admin: 0. boss: 1, teamleader: 2, employee: 3 }
end
