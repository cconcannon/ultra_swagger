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
    chris_races
    chris_shoes
    chris_outerwear
    chris_hydration_packs
    chris_base_layers
  end
  
  private
  
  def chris_admin_user
  end
  
  def chris_races
    races.values.each do |race|
      Race.create(race)
      puts "#{race["name"]} in #{race["location"]} added to race list!"
    end
  end
  
  def chris_shoes
    shoes.values.each do |shoe|
      Shoe.create(shoe)
      puts "#{shoe["brand"]} #{shoe["model"]} created!"
    end
  end

  def chris_outerwear
    outerwear.values.each do |jacket|
      Outerwear.create(jacket)
      puts "#{jacket["brand"]} #{jacket["model"]} created!"
    end
  end
  
  def chris_hydration_packs
    hydration_packs.values.each do |hp|
      HydrationPack.create(hp)
      puts "#{hp["brand"]} #{hp["model"]} created!"
    end
  end
  
  def chris_base_layers
    base_layers.values.each do |bl|
      BaseLayer.create(bl)
      puts "#{bl["brand"]} #{bl["model"]} created!"
    end
  end
  
  def shoes
    YAML.load(File.read("db/seeds/shoes.yml"))
  end
  
  def hydration_packs
    YAML.load(File.read("db/seeds/hydration_packs.yml"))
  end
  
  def outerwear
    YAML.load(File.read("db/seeds/outerwear.yml"))
  end
  
  def base_layers
    YAML.load(File.read("db/seeds/base_layers.yml"))
  end
  
  def races
    YAML.load(File.read("db/seeds/races.yml"))
  end
end

Seed.new