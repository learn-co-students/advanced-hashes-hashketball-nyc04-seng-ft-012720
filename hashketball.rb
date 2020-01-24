# Write your code here!
require 'pry'

def game_hash
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points =>19,
        :rebounds =>2,
        :assists =>2,
        :steals =>4,
        :blocks =>11,
        :slam_dunks =>1
      }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number =>4,
        :shoe =>18,
        :points =>10,
        :rebounds =>1,
        :assists =>1,
        :steals =>2,
        :blocks =>7,
        :slam_dunks =>2
    },
    {
        :player_name =>"Bismack Biyombo",
        :number =>0,
        :shoe =>16,
        :points =>12,
        :rebounds =>4,
        :assists =>7,
        :steals =>22,
        :blocks =>15,
        :slam_dunks =>10
      },
      {
        :player_name =>"DeSagna Diop",
        :number =>2,
        :shoe =>14,
        :points =>24,
        :rebounds =>12,
        :assists =>12,
        :steals =>4,
        :blocks =>5,
        :slam_dunks =>5
      },
      {
        :player_name =>"Ben Gordon",
        :number =>8,
        :shoe =>15,
        :points =>33,
        :rebounds =>3,
        :assists =>2,
        :steals =>1,
        :blocks =>1,
        :slam_dunks =>0
      },
      {
        :player_name =>"Kemba Walker",
        :number =>33,
        :shoe =>15,
        :points =>6,
        :rebounds =>12,
        :assists =>12,
        :steals =>7,
        :blocks =>5,
        :slam_dunks =>12
      }
      ]
    }
  }
end
def num_points_scored(player_name)
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
end
def shoe_size(player_name)
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
end
def team_colors(team_name)
  hasket = game_hash()
  hasket.each do |team,team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  end
end
def team_names()
  team_name = []
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_name.push(team_info[:team_name])
  end
  return team_name
end
def player_numbers(team_name)
  array = []
  hasket = game_hash()
  hasket.each do |team,team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |player|
        array.push(player[:number])
      end
    end
  end
  return array
end
def player_stats(player_name)
  hasket = game_hash()
  hasket.each do |team,team_info|
      team_info[:players].each do |player|
       if player[:player_name] == player_name
         stats = player
         stats.delete(:player_name)
         return stats
       end
     end
   end
 end
def big_shoe_rebounds
  big_shoe = nil
  hasket = game_hash()
  hasket.each do |team,team_info|
      team_info[:players].each do |player|
        if big_shoe == nil || big_shoe[:shoe] < player[:shoe]
          big_shoe = player
        end
      end
    end
    return big_shoe[:rebounds]
end

def most_points_scored
  most_points = nil
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_info[:players].each do |player|
        if most_points == nil || most_points[:points] < player[:points]
          most_points = player
        end
      end
    end
  return most_points[:player_name]
end

def winning_team
  most_points = 0
  win_team = ""
  hasket = game_hash()
  hasket.each do |team,team_info|
    total_current = 0
    team_info[:players].each do |player|
      total_current += player[:points]
    end
    if total_current > most_points
      win_team = team_info[:team_name]
      most_points = total_current
    end
   end
  return win_team
end

def player_with_longest_name
  long_name = ""
  longest_length = 0
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_info[:players].each do |player|
      current_name = player[:player_name]
      current_length = current_name.length
      if longest_length < current_length
        longest_length = current_length
        long_name = current_name
      end
    end
  end
  return long_name
end

def long_name_steals_a_ton?
  most_steals_name = ""
  most_steals = 0
  hasket = game_hash()
  hasket.each do |team,team_info|
    team_info[:players].each do |player|
      current_steals = player[:steals]
      if current_steals > most_steals
        most_steals = current_steals
        most_steals_name = player[:player_name]
      end
    end
  end
  return player_with_longest_name() == most_steals_name
end


