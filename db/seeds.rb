# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def initialize
    chris_admin_user
    chris_strava_user_total
    chris_races
    chris_items
    chris_reviews
  end
  
  private
  
  def chris_admin_user
    User.create(
      id: 1,
      strava_id: 5189780,
      email: "christopher.concannon@gmail.com",
      firstname: "Christopher",
      lastname: "Concannon",
      admin: true
    )
  end
  
  def chris_strava_user_total
    StravaUserTotal.create(
      user: User.find_by(strava_id: 5189780),
      avg_weekly_distance: 49,
      avg_weekly_time: 7.0,
      avg_weekly_elevation_gain: 4458,
      avg_speed: 7.0
    )
  end
  
  def chris_races
    races.values.each do |race|
      Race.create(race)
      puts "#{race["name"]} in #{race["location"]} added to race list!"
    end
  end
  
  def chris_items
    items.values.each do |item|
      i = Item.create(item)
      puts "#{item["brand"]} #{item["model"]} created!"
    end
  end
  
  def chris_reviews
    reviews.values.each do |review|
      r = Review.create(review)
      User.find(1).reviews << r
      puts "Review ##{r["id"]} created!"
    end
  end
  
  def items
    YAML.load(File.read("db/fixtures/items.yml"))
  end
  
  def races
    YAML.load(File.read("db/fixtures/races.yml"))
  end

  def reviews
    YAML.load(File.read("db/fixtures/reviews.yml"))
  end
end

Seed.new