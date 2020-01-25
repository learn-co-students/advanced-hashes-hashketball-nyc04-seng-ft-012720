# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {:player_name => "Alan Anderson",:number => 0,:shoe => 16,:points => 22,:rebounds => 12,:assists => 12,:steals => 3,:blocks => 1,:slam_dunks => 1},
        {:player_name => "Reggie Evans",:number => 30,:shoe => 14,:points => 12,:rebounds => 12,:assists => 12,:steals => 12,:blocks => 12,:slam_dunks => 7},
        {:player_name => "Brook Lopez",:number => 11,:shoe => 17,:points => 17,:rebounds => 19,:assists => 10,:steals => 3,:blocks => 1,:slam_dunks => 15},
        {:player_name => "Mason Plumlee",:number => 1,:shoe => 19,:points => 26,:rebounds => 11,:assists => 6,:steals => 3,:blocks => 8,:slam_dunks => 5},
        {:player_name => "Jason Terry",:number => 31,:shoe => 15,:points => 19,:rebounds => 2,:assists => 2,:steals => 4,:blocks => 11,:slam_dunks => 1}
      ]
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {:player_name => "Jeff Adrien",:number => 4,:shoe => 18,:points => 10,:rebounds => 1,:assists => 1,:steals => 2,:blocks => 7,:slam_dunks => 2},
        {:player_name => "Bismack Biyombo",:number => 0,:shoe => 16,:points => 12,:rebounds => 4,:assists => 7,:steals => 22,:blocks => 15,:slam_dunks => 10},
        {:player_name => "DeSagna Diop",:number => 2,:shoe => 14,:points => 24,:rebounds => 12,:assists => 12,:steals => 4,:blocks => 5,:slam_dunks => 5},
        {:player_name => "Ben Gordon",:number => 8,:shoe => 15,:points => 33,:rebounds => 3,:assists => 2,:steals => 1,:blocks => 1,:slam_dunks => 0},
        {:player_name => "Kemba Walker",:number => 33,:shoe => 15,:points => 6,:rebounds => 12,:assists => 12,:steals => 7,:blocks => 5,:slam_dunks => 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |team,info|
    info.each do |attribute,data|
      next unless attribute == :players

      data.each do |player|
        return player[:points] if player[:player_name] == player_name
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team,info|
    info.each do |attribute,data|
      next unless attribute == :players

      data.each do |player|
        return player[:shoe] if player[:player_name] == player_name
      end
    end
  end
end

def team_colors(teams_name)
  game_hash.each do |team,info|
    return game_hash[team][:colors] if info[:team_name] == teams_name
  end
end

def team_names
  game_hash.map do |team,info|
    info[:team_name]
  end
end

def player_numbers(teams_name)
  numbers = []
  game_hash.each do |team,info|
    next unless info[:team_name] == teams_name

    info.each do |attribute,data|
      next unless attribute == :players

      data.each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |team,info|
    info.each do |attribute,data|
      next unless attribute == :players

      game_hash[team][attribute].each do |player|
        next unless player[:player_name] == player_name

        stats = player.delete_if do |key,value|
          key == :player_name
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebound_count = 0

  game_hash.each do |team,info|
    info[:players].each do |player|

      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebound_count = player[:rebounds]
      end
    end
  end

  rebound_count
end

###--BONUS--###

def most_points_scored
  most_points = 0
  mvp = nil
  game_hash.each do |team,info|
    info[:players].each do |player|

      if player[:points] > most_points
        most_points = player[:points]
        mvp = player[:player_name]
      end
    end
  end

  mvp
end

def winning_team
  hornets_score = []
  nets_score = []
  game_hash.each do |team,info|
    info[:players].each do |player|
      if info[:team_name] == "Brooklyn Nets"
        nets_score << player[:points]
      else
        hornets_score << player[:points]
      end
    end
  end

  if hornets_score.inject(:+) < nets_score.inject(:+)
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |team,info|
    info[:players].each do |player|

      if player[:player_name].length > longest_name.length
        longest_name = player[:player_name]
      end
    end
  end

  longest_name
end

def most_steals
  steals_record = 0
  the_name = nil
  game_hash.each do |team,info|
    info[:players].each do |player|

      if player[:steals] > steals_record
        steals_record = player[:steals]
        the_name = player[:player_name]
      end
    end
  end

  the_name
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end
