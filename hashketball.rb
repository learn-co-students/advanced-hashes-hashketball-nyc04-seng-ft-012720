# Write your code here!

def game_hash
   { :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1}, 
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7}, 
         {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15}, 
         {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5}, 
         {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
      ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [ 
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
         {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10}, 
         {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5}, 
         {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0}, 
         {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
        ]
    }
  }
end

def num_points_scored(name)
	game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:player_name] == name
    			return player[:points] 
    			end 
    			end
    	end
  end
end
end

def shoe_size(name)
	game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:player_name] == name
    			return player[:shoe] 
    			end 
    			end
    	end
  end
end
end

def team_colors(teamname)
  game_hash.each do |team, teamstats|
    teamstats.each do |key,value|
      if key == :colors && teamstats[:team_name] == teamname
        return value
      end
    end 
  end
end 

def team_names
  output = []
  game_hash.each{|place,teamblock| output << teamblock[:team_name]}
  return output
end

def player_numbers(teamname)
  output = []
  game_hash.each{|place,teamblock|
    if teamblock[:team_name] == teamname
      teamblock[:players].each{|player| output << player[:number]
      }
    end
  }
  return output
end

def player_stats(name)
  output = {}
  game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:player_name] == name
    			  output = player.clone
    			end 
    		end
    	end
    end
  end
  output.delete(:player_name)
  return output
end

def big_shoe_rebounds
  largestshoe = 0
  game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:shoe] > largestshoe
    	      largestshoe = player[:shoe]
    			  
    			 end 
    		end
    	 end
    end
  end
   # largest shoe found
   game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
     if key == :players
    	  playerstats.each do |player|
    	    if player[:shoe] == largestshoe
    	      return player[:rebounds]
    	    end
    	   end
    	 end
    	end
    end
end

def most_points_scored
  highestscore = 0
  game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:points] > highestscore
    	      highestscore = player[:points]
    			  
    			 end 
    		end
    	 end
    end
  end
   # highestscore found
   game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
     if key == :players
    	  playerstats.each do |player|
    	    if player[:points] == highestscore
    	      return player[:player_name]
    	    end
    	   end
    	 end
    	end
    end
end

def winning_team
  hometotal = game_hash[:home][:players].reduce(0){|total,player| total + player[:points]}
  awaytotal = game_hash[:away][:players].reduce(0){|total,player| total + player[:points]}
  if hometotal > awaytotal
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longestlength = 0
  game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:player_name].length > longestlength
    	      longestlength = player[:player_name].length
    			  
    			 end 
    		end
    	 end
    end
  end
   # longest name found
   game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
     if key == :players
    	  playerstats.each do |player|
    	    if player[:player_name].length == longestlength
    	      return player[:player_name]
    	    end
    	   end
    	 end
    	end
    end
end

def long_name_steals_a_ton?
  stealer = []
  moststeals = 0	
  game_hash.each do |team, teamstats|
    teamstats.each do |key,playerstats|
      if key == :players
    	  playerstats.each do |player|
    	    if player[:steals] > moststeals
    	      stealer = player[:player_name]
    	      moststeals = player[:steals]
    			end 
    			end
    	end
  end
end
  if player_with_longest_name = stealer
    return true
  else
    return false
  end
end