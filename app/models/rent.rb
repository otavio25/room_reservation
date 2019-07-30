class Rent < ApplicationRecord
  belongs_to :room

  #kaminari paginação
  paginates_per 10 
end
