class Account < ApplicationRecord
  extend Enumerize

  enumerize :currency, in: %i[eth]
  belongs_to :user
end
