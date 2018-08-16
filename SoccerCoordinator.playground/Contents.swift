import UIKit

//INPUT DATA
let player1: [String: Any] = [ "name": "Joe Smith", "height": 42.0,
                               "isExperienced": true, "guardians": "Jim and Jan Smith"]
let player2: [String: Any] = [ "name": "Jill Tanne", "height": 36.0,
                               "isExperienced": true, "guardians": "Clara Tanner"]
let player3: [String: Any] = [ "name": "Bill Bon", "height": 43.0,
                               "isExperienced": true, "guardians": "Sara and Jenny Bon"]
let player4: [String: Any] = [ "name": "Eva Gordon", "height": 45.0,
                               "isExperienced": false, "guardians": "Wendy and Mike Gordon"]
let player5: [String: Any] = [ "name": "Matt Gill", "height": 40.0,
                               "isExperienced": false, "guardians": "Charles and Sylvia Gill"]
let player6: [String: Any] = [ "name": "Kimmy Stein", "height": 41.0,
                               "isExperienced": false, "guardians": "Bill and Hillary Stein"]
let player7: [String: Any] = [ "name": "Sammy Adams", "height": 45.0,
                               "isExperienced": false, "guardians": "Jeff Adams"]
let player8: [String: Any] = [ "name": "Karl Saygan", "height": 42.0,
                               "isExperienced": true, "guardians": "Heather Bledsoe"]
let player9: [String: Any] = [ "name": "Suzane Greenberg", "height": 44.0,
                               "isExperienced": true, "guardians": "Henrietta Dumas"]
let player10: [String: Any] = [ "name": "Sal Dali", "height": 41.0,
                                "isExperienced": false, "guardians": "Gala Dali"]
let player11: [String: Any] = [ "name": "Joe Kavalier", "height": 39.0,
                                "isExperienced": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String: Any] = [ "name": "Ben Finkelstein", "height": 44.0,
                                "isExperienced": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = [ "name": "Diego Soto", "height": 41.0,
                                "isExperienced": true, "guardians": "Robin and Sarika Soto"]
let player14: [String: Any] = [ "name": "Chloe Alaska", "height": 47.0,
                                "isExperienced": false, "guardians": "David and Jamie Alaska"]
let player15: [String: Any] = [ "name": "Arnold Willis", "height": 43.0,
                                "isExperienced": false, "guardians": "Claire Willis"]
let player16: [String: Any] = [ "name": "Phillip Helm", "height": 44.0,
                                "isExperienced": true, "guardians": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = [ "name": "Les Clay", "height": 42.0,
                                "isExperienced": true, "guardians": "Wynonna Brown"]
let player18: [String: Any] = [ "name": "Herschel Krustofski", "height": 45.0,
                                "isExperienced": true, "guardians": "Hyman and Rachel Krustofski"]

var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]


let practiceDateTime = ["Dragons": "March 17, 1pm", "Sharks": "March 17, 3pm", "Raptors": "March 18, 1pm"]


//SPLIT LOGIC
var experiencedPlayers = [[String: Any]]()
var unexperiencedPlayers = [[String: Any]]()

for player in players {
    if let experience = player["isExperienced"] {
        if let playerExperience = experience as? Bool {
            if playerExperience == true {
                experiencedPlayers.append(player)
                
            } else {
                unexperiencedPlayers.append(player)
            }
        }
    }
}

var theLeague: [[String: Any]] = []

func split(players: [[String: Any]]) {
 
    for i in 1..<players.count {
        var leaguePlayer = players[i-1]
        if i % 3 == 0 {
            leaguePlayer["team"] = "Dragons"
        } else if i % 2 == 0 {
            leaguePlayer["team"] = "Sharks"
        } else {
            leaguePlayer["team"] = "Raptors"
        }
        theLeague.append(leaguePlayer)
    }
}

split(players: experiencedPlayers + unexperiencedPlayers)


//PRINTING LETTERS
func generateLetter(player: [String:Any] , practiceDateTime: String ) -> String {
    if let name = player["name"], let team = player["team"], let guardians = player["guardians"] {
        return "Dear \(String(describing: name)), \n Congratulations! You become part of the team \(String(describing: team)).\n You can receive you unifrom with guardian name \(String(describing: guardians)) before your next practice on \(practiceDateTime) \n Kind regards, \n The League"
    } else {
        return "There is no information for the player"
    }
}

var letters = [String]()
for player in theLeague {
    if let team = player["team"] as? String, let practiceDateTime = practiceDateTime[team] {
        let letter = generateLetter(player: player, practiceDateTime: practiceDateTime)
        print(letter)
        letters.append(letter)
    }
}
