# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# rails generate model Studio name:string

# rails generate model Movie title:string year_released:integer rated:string studio_id:integer

# rails generate model Actor name:string agent_id:integer

# rails generate model Role movie_id:integer actor_id:integer character_name:string

# rails generate model Agent name:string

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# add studio
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

# add movies (Linked to the studio variable above)
warner = Studio.find_by({ "name" => "Warner Bros." })

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner["id"] 
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = 2008
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = 2012
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner["id"]
new_movie.save

#add agent
new_agent = Agent.new
new_agent["name"] = "Ari Emanuel"
new_agent.save

# add actors
agent = Agent.find_by({ "name" => "Ari Emanuel" })

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor["agent_id"] = agent["id"]
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

# add roles
# find by for batman begins
begins = Movie.find_by({ "title" => "Batman Begins" })
bale = Actor.find_by({ "name" => "Christian Bale" })
caine = Actor.find_by({ "name" => "Michael Caine" })
neeson = Actor.find_by({ "name" => "Liam Neeson" })
holmes = Actor.find_by({ "name" => "Katie Holmes" })
oldman = Actor.find_by({ "name" => "Gary Oldman" })

# bruce wayne
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

# alfred
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

# Ra's Al Ghul
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

# Rachel Dawes
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

# Commissioner Gordon
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

# find by for dark knight
dark_knight = Movie.find_by({ "title" => "The Dark Knight" })
ledger = Actor.find_by({ "name" => "Heath Ledger" })
eckhart = Actor.find_by({ "name" => "Aaron Eckhart" })
gyllenhaal = Actor.find_by({ "name" => "Maggie Gyllenhaal" })

# Bruce Wayne
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

# Joker
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = ledger["id"]
role["character_name"] = "Joker"
role.save

# Harvey Dent
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

# Alfred
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

# Rachel Dawes
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save

# find by for the dark knight rises
rises = Movie.find_by({ "title" => "The Dark Knight Rises" })
hardy = Actor.find_by({ "name" => "Tom Hardy" })
levitt = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })
hathaway = Actor.find_by({ "name" => "Anne Hathaway" })

# Bruce Wayne
role = Role.new
role["movie_id"] = rises["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

# Commissioner Gordon
role = Role.new
role["movie_id"] = rises["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

# Bane
role = Role.new
role["movie_id"] = rises["id"]
role["actor_id"] = hardy["id"]
role["character_name"] = "Bane"
role.save

# John Blake
role = Role.new
role["movie_id"] = rises["id"]
role["actor_id"] = levitt["id"]
role["character_name"] = "John Blake"
role.save

# Selina Kyle
role = Role.new
role["movie_id"] = rises["id"]
role["actor_id"] = hathaway["id"]
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all

# Loop through movies
for movie in movies
  # Find the studio 
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  
  # create output
  puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
