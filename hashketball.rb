def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

def num_points_scored(player)
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |players|
          if players[:player_name] == player
            return players[:points]
          end
        end  
      end  
    end  
  end  
end  
  
  
def shoe_size(player)
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:player_name] == player
            return player_info[:shoe]
          end
        end  
      end  
    end  
  end  
end    
  
def team_colors(team)
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if value[:team_name] == team
        return value[:colors]
      end
    end
  end   
end   
  
def team_names
  names = []
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :team_name
        names << value[:team_name]
      end
    end
  end  
  return names
end  
  
def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if value[:team_name] == team
        if second_key == :players
          second_value.each do |player_info|
            jersey_numbers << player_info[:number]
          end
        end     
      end
    end
  end  
  return jersey_numbers
end  
  
  
def player_stats(player)
  stats_hash = {}
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:player_name] == player
            stats_hash[:number] = player_info[:number]
            stats_hash[:shoe] = player_info[:shoe]
            stats_hash[:points] = player_info[:points]
            stats_hash[:rebounds] = player_info[:rebounds]
            stats_hash[:assists] = player_info[:assists]
            stats_hash[:steals] = player_info[:steals]
            stats_hash[:blocks] = player_info[:blocks]
            stats_hash[:slam_dunks] = player_info[:slam_dunks]
          end
        end
      end
    end
  end  
  return stats_hash
end   

def big_shoe_rebounds
  rebounds = 0
  big_foot = 0
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:shoe] > big_foot
            big_foot = player_info[:shoe]
            rebounds = player_info[:rebounds]
          end
        end
      end
    end   
  end 
  return rebounds
end

def most_points_scored
  points = 0
  mvp = ""
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:points] > points
            points = player_info[:points]
            mvp = player_info[:player_name]
          end
        end
      end
    end   
  end 
  return mvp
end

def winning_team 
  nets = 0 
  hornets = 0
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if value[:team_name] == 'Brooklyn Nets'
        if second_key == :players
          second_value.each do |player_info|
            nets += player_info[:points]
          end
        end    
      elsif value[:team_name] == 'Charlotte Hornets'
        if second_key == :players
          second_value.each do |player_info|
            hornets += player_info[:points]
          end
        end    
      end
    end
  end  
  if nets > hornets
    return 'Brooklyn Nets'
  else
    return 'Charlotte Hornets'
  end
end    


def player_with_longest_name
  longest_name = ""
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:player_name].length > longest_name.length
            longest_name = player_info[:player_name]
          end
        end
      end    
    end
  end
  return longest_name
end  

def long_name_steals_a_ton?
  long_name = ""
  steals = 0
  game_hash.each do |key, value|
    value.each do |second_key, second_value|
      if second_key == :players
        second_value.each do |player_info|
          if player_info[:steals] > steals
            steals = player_info[:steals]
            long_name = player_info[:player_name] 
          end
        end
      end    
    end
  end
  if long_name = player_with_longest_name
    return true
  end  
end  


