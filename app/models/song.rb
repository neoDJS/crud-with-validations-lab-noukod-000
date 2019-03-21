class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year],
    message: "should happen once per year with the same artist" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: Proc.new{|s| (s.released == true) and (s.release_year <= Time.new.year) }
  validates :artist_name, presence: true
end
