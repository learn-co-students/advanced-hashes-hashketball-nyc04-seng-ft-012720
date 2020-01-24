# Write your code here!

require "pry"

def game_hash()
{
  :away =>
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>
      [
        {
          :players_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10,
          :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
        },
        {
          :players_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12,
          :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10
        },
        {
          :players_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24,
          :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
        },
        {
          :players_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33,
          :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
        },
        {
          :players_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6,
          :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12
        }
    ]
  },
 :home =>
    {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>
    [
      {
        :players_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22,
        :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
      },
      {
        :players_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12,
        :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
      },
      {
        :players_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17,
        :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
      },
      {
        :players_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26,
        :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
      },
      {
        :players_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19,
        :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
      }
    ]

    }
    }
        end

def num_points_scored(players_name)
  game_hash.each do |place, team|
  team.each do |attribute, data|
    if attribute == :players
      data.each do |player|
        if player[:players_name] == players_name
        return player[:points]
      end
    end
  end
end
end
end


def shoe_size(players_name)
  game_hash.each do |place, team|
  team.each do |attribute, data|
    if attribute == :players
      data.each do |player|
        if player[:players_name] == players_name
        return player[:shoe]
      end
    end
  end
end
end
end



def team_colors(team_name)
  game_hash.each do |place, team|
  if team[:team_name] == team_name
    return team[:colors]
      end
    end
end

def team_names
  team_names_array = []
  game_hash.each do |team, attributes|
    team_names_array << game_hash[team][:team_name]
  end
  return team_names_array
end


def player_numbers(input)
  output = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == input
      team_info.each do |key, value|
        if key == :players
          value.each do |player|
          output.push(player[:number])
          end
        end
      end
    end
  end
  return output
end

def player_stats(player_name)
  game_hash.each do |location, team|
    team.each do |attribute, data|
     if attribute == :players
       data.each do |player|
        if player[:players_name] == player_name
          player.delete(:players_name)
          return player
        end
       end
      end
    end
  end
end

def big_shoe_rebounds

  biggest_shoe = 0
  player_rebounds = 0
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        player_rebounds = player[:rebounds]
      end
    end
  end
  return player_rebounds
end




def winning_team
  top_team = {}
  game_hash.values.each do |team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    top_team[team_info[:team_name]] = team_points
  end
  top_team.key(top_team.values.max)
end


def long_name_steals_a_ton?
 longest = {}
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      longest[player[:player_name]] = player[:steals]
    end
  end

max_steals = longest.values.max
longest[longest.key(max_steals)] == max_steals

end
