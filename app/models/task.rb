class Task < ApplicationRecord
  
  belongs_to :user
  before_save :set_header

  enum status: { unfinished: 0, finished: 1 }

  validates_presence_of :description, :website, :status

end
