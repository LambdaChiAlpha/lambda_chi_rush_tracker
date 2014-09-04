class Rushee < ActiveRecord::Base
  enum standing: %i{ freshmen sophomore junior senior }
end
