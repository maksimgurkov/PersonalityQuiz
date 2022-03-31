//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var descriptionAnimal: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        result()

    }
    
    private func result() {
        
        var dogs: [Animal] = []
        var cats: [Animal] = []
        var rabbits: [Animal] = []
        var turtles: [Animal] = []
        
        var animals: [Animal] = []
        for animal in answers {
            animals.append(animal.animal)
        }
        
        for animal in animals {
            if animal == .dog {
                dogs.append(animal)
            } else if animal == .cat {
                cats.append(animal)
            } else if animal == .rabbit {
                rabbits.append(animal)
            } else if animal == .turtle {
                turtles.append(animal)
            }
        }
        
        if dogs.count > cats.count && dogs.count > rabbits.count && dogs.count > turtles.count {
            emojiLabel.text = "Вы - \(Animal.dog.rawValue)"
            descriptionAnimal.text = "\(Animal.dog.definition)"
        } else if cats.count > dogs.count && cats.count > rabbits.count && cats.count > turtles.count {
            emojiLabel.text = "Вы - \(Animal.cat.rawValue)"
            descriptionAnimal.text = "\(Animal.cat.definition)"
        } else if rabbits.count > dogs.count && rabbits.count > cats.count && rabbits.count > turtles.count {
            emojiLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            descriptionAnimal.text = "\(Animal.rabbit.definition)"
        } else if turtles.count > dogs.count && turtles.count > cats.count && turtles.count > rabbits.count {
            emojiLabel.text = "Вы - \(Animal.turtle.rawValue)"
            descriptionAnimal.text = "\(Animal.turtle.definition)"
        }
        
    }
}
