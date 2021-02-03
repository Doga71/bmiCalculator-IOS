//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Value = "0.0"

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        //print(String(format: "%0.2f", sender.value))
        let height = String(format: "%0.2f", sender.value)
        heightLable.text = "\(height) m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLable.text = "\(weight) Kg"
        //print(Int(sender.value))
    }
    @IBAction func calcutateButton(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let BMI = (weight / (height * height))   // pow(height, 2)
       // print(BMI)
        Value = String(format: "%.2f", BMI)
        
      /*  let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%0.1f", BMI)
        self.present(secondVC   , animated: true, completion: nil)       */
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = Value
        }
    }
}

