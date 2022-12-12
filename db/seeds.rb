# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
# Recipe.delete_all
# Category.delete_all
# Spice.delete_all
# Creator.delete_all

# TODO:
#   does it give unique of all generator or inside food object only?>Yes across all. ditch object?
#       maybe, unrelated data but less code
#   create many assoc through foreign key? No , it works auto
#   too many foreign keys created for little recipes?> was using food.ethnic_category
#   use unique with validation for all
#   populate each table first?
# To reset id sequence use in console: ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '<table_name>'")
Faker::UniqueGenerator.clear # Clears used values for all generators
# Increasing > 50 may raise an exception! Try while no exception raised? Rescue?
# increasing times may not create more recipes?!
# only 14 unique descriptions, 54 dishes etc...
# removed uniqueness validation for fake data
50.times do
  food = Faker::Food
  category = Category.create(name: food.unique.ethnic_category)
  spice = Spice.create(name: food.unique.spice)
  creator = Creator.create(name:        Faker::FunnyName.unique.two_word_name,
                           nationality: food.ethnic_category) # Faker::Nation.nationality bad

  # don't use unique here,validates. Assumes that a recipe can only be made by a unique creator
  # loop create recipes?~3
  3.times do
    pp Recipe.create(name: food.dish, description: food.description, creator_id: creator.id,
                     spice_id: spice.id, category_id: category.id)
  end

  # 3.times do |n|
  # .valid? Or Faker::Name.unique.name # This will return a unique name every time it is called
  if spice.valid?
    # Some categories etc... are created through a spice, how to reference foreign key?
    spice.categories.create(name: food.unique.ethnic_category)
    spice.creators.create(name: Faker::FunnyName.two_word_name) # Unlikely use case
  end

  # What if the spice exists? Create it's own model? works fine
  creator.spices.create(name: food.unique.spice) if creator.valid?
  category.spices.create(name: food.unique.spice) if category.valid?
  # end
end

# ---------Prints
# puts Creator.all.pretty_inspect
# pp Category.all
# pp Spice.all
# pp Recipe.all
# Spice.all.each do |s|
#   pp s.name
#   pp s.categories
# end
# Spice.all.each { |s| pp s.creators }
