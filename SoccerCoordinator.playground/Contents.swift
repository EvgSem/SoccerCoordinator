import UIKit

//INPUT DATA
let player1: [String: Any] = [ "name": "Joe Smith", "height": 42.0,
                               "experience": true, "guardians": "Jim and Jan Smith"]
let player2: [String: Any] = [ "name": "Jill Tanne", "height": 36.0,
                               "experience": true, "guardians": "Clara Tanner"]
let player3: [String: Any] = [ "name": "Bill Bon", "height": 43.0,
                               "experience": true, "guardians": "Sara and Jenny Bon"]
let player4: [String: Any] = [ "name": "Eva Gordon", "height": 45.0,
                               "experience": false, "guardians": "Wendy and Mike Gordon"]
let player5: [String: Any] = [ "name": "Matt Gill", "height": 40.0,
                               "experience": false, "guardians": "Charles and Sylvia Gill"]
let player6: [String: Any] = [ "name": "Kimmy Stein", "height": 41.0,
                               "experience": false, "guardians": "Bill and Hillary Stein"]
let player7: [String: Any] = [ "name": "Sammy Adams", "height": 45.0,
                               "experience": false, "guardians": "Jeff Adams"]
let player8: [String: Any] = [ "name": "Karl Saygan", "height": 42.0,
                               "experience": true, "guardians": "Heather Bledsoe"]
let player9: [String: Any] = [ "name": "Suzane Greenberg", "height": 44.0,
                               "experience": true, "guardians": "Henrietta Dumas"]
let player10: [String: Any] = [ "name": "Sal Dali", "height": 41.0,
                               "experience": false, "guardians": "Gala Dali"]
let player11: [String: Any] = [ "name": "Joe Kavalier", "height": 39.0,
                                "experience": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String: Any] = [ "name": "Ben Finkelstein", "height": 44.0,
                                "experience": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = [ "name": "Diego Soto", "height": 41.0,
                                "experience": true, "guardians": "Robin and Sarika Soto"]
let player14: [String: Any] = [ "name": "Chloe Alaska", "height": 47.0,
                                "experience": false, "guardians": "David and Jamie Alaska"]
let player15: [String: Any] = [ "name": "Arnold Willis", "height": 43.0,
                                "experience": false, "guardians": "Claire Willis"]
let player16: [String: Any] = [ "name": "Phillip Helm", "height": 44.0,
                                "experience": true, "guardians": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = [ "name": "Les Clay", "height": 42.0,
                                "experience": true, "guardians": "Wynonna Brown"]
let player18: [String: Any] = [ "name": "Herschel Krustofski", "height": 45.0,
                                "experience": true, "guardians": "Hyman and Rachel Krustofski"]

var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]


let practiceDateTime = ["Dragons": "March 17, 1pm", "Sharks": "March 17, 3pm", "Raptors": "March 18, 1pm"]


//SPLIT LOGIC
var experiencedPlayers = [[String: Any]]()
var unexperiencedPlayers = [[String: Any]]()

for player in players {
    let experience = player["experience"]! as! Bool
    if experience == true {
        experiencedPlayers.append(player)
        
    } else {
        unexperiencedPlayers.append(player)
    }
}

var teamDragons = [[String: Any]]()
var teamSharks = [[String: Any]]()
var teamRaptors = [[String: Any]]()

let numExperiencedPerTeam = experiencedPlayers.count/3
let numUnxperiencedPerTeam = unexperiencedPlayers.count/3

var theLeague: [[String: Any]] = []

func split(players: [[String: Any]]) {

    var i = 0

    for player in players {
        var leaguePlayer = player
        if i>=0 && i<numExperiencedPerTeam {
            leaguePlayer["team"] = "Dragons"
        } else if i>=numExperiencedPerTeam && i<2*numExperiencedPerTeam {
            leaguePlayer["team"] = "Sharks"
        } else {
            leaguePlayer["team"] = "Raptors"
        }
        theLeague.append(leaguePlayer)
        i+=1
    }
}

split(players: experiencedPlayers)
split(players: unexperiencedPlayers)


//PRINTING LETTERS
func generateLetter(player: [String:Any] , practiceDateTime: String ) -> String {

    return "Dear \(String(describing: player["name"]!)), \n Congratulations! You become part of the team \(String(describing: player["team"]!)).\n You can receive you unifrom with guardian name \(String(describing: player["guardians"]!)) before your next practice on \(practiceDateTime) \n Kind regards, \n The League"
}

var letters = [String]()
for player in theLeague {
    let team = player["team"] as! String
    let letter = generateLetter(player: player, practiceDateTime: practiceDateTime[team]!)
    print(letter)
    letters.append(letter)
}
