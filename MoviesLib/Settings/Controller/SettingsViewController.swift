//
//  SettingsViewController.swift
//  MoviesLib
//
//  Created by Bruno Oliveira on 13/09/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let userDefault = UserDefaults.standard

    @IBOutlet weak var switchAutoPlay: UISwitch!
    @IBOutlet weak var segmentControlColor: UISegmentedControl!
    @IBOutlet weak var textFieldCategory: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userDefault.set(textFieldCategory.text, forKey: "category")
        textFieldCategory.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let colorIndex = userDefault.integer(forKey: "color")
        segmentControlColor.selectedSegmentIndex = colorIndex
        
        let category = userDefault.string(forKey: "category")
        textFieldCategory.text = category
        
        let autoplay = userDefault.bool(forKey: "autoplay")
        switchAutoPlay.setOn(autoplay, animated: true)
    }
    
    @IBAction func changeAutoPlay(_ sender: UISwitch) {
        userDefault.set(sender.isOn, forKey: "autoplay")
    }
    
    @IBAction func changeCategory(_ sender: UITextField) {
        
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        userDefault.set(sender.selectedSegmentIndex, forKey: "color")
    }
}
