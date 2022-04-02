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
        
        var frequenOfAnimal: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalsType = frequenOfAnimal[animal] {
                frequenOfAnimal.updateValue(animalsType + 1, forKey: animal)
            } else {
                frequenOfAnimal[animal] = 1
            }
        }
        
        let sortedAnimal = frequenOfAnimal.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnimal.first?.key else { return }
        
        updateUI(animal: resultAnimal)
        
    }
    
    private func updateUI(animal: Animal) {
        emojiLabel.text = "ВЫ = \(animal.rawValue)"
        descriptionAnimal.text = animal.definition
    }
}
