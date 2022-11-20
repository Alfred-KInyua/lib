class Student < ApplicationRecord
    validates :name, presence: true, length:{minimum: 3, maximum: 10 }
    validates :age, presence: true, length: {minimum: 1, maximum:3}
end
