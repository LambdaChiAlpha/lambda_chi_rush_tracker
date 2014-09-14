class Rushee < ActiveRecord::Base
  PERMITTED_ATTRIBUTES = %i{
    name
    avatar
    avatar_file_name
    avatar_file_size
    avatar_content_type
    avatar_updated_at
    description
    standing
    room_number
    hall
    major
  }

  POSSIBLE_STANDINGS = %i{
    freshman
    sophomore
    junior
    senior
  }

  POSSIBLE_HALLS = %i{
    percopo
    speed
    bsb
    deming
    scharpenberg
    mees
    blumberg
    apartments_east
    apartments_west
    lakeside
    off_campus
  }

  HALL_NAMES = {
    percopo: "Percopo",
    speed: "Speed",
    bsb: "BSB",
    deming: "Deming",
    scharpenberg: "Scharpenberg",
    mees: "Mees",
    blumberg: "Blumberg",
    apartments_east: "Apartments East",
    apartments_west: "Apartments West",
    lakeside: "Lakeside",
    off_campus: "Off Campus"
  }.freeze

  enum standing: POSSIBLE_STANDINGS
  enum hall: POSSIBLE_HALLS

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  def self.humanized_hall_options
    halls.map { |hall, _| [HALL_NAMES[hall.to_sym], hall] }
  end

  def self.humanized_standing_options
    standings.map { |standing, _| [standing.humanize, standing] }
  end

  def room
    "#{humanized_hall} #{room_number}"
  end

  def humanized_hall
    HALL_NAMES[hall.to_sym]
  end
end
