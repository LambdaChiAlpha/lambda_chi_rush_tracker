class Note < ActiveRecord::Base
  enum impression: %i{
    negative
    positive
  }

  belongs_to :rushee

  validates_presence_of :submitter
end
