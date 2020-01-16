//
//  ViewController.swift
//  CelsiusConverter
//
//  Created by David Svensson on 2020-01-16.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    
    private let userDefaultsRowKey = "defaultPickerRow"
    private var temperatureValues = (-100...100).map{$0} //[Int]()
    
    let converter = CelsiusConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temperatureLabel.text = "0 F"
        
        let defaultPickerRow = initialPickerRow()
        
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickerRow, inComponent: 0)
        
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
//
        // Do any additional setup after loading the view.
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return temperatureValues.count / 2
        }
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
//        if component == 0 {
//            return 4
//        } else  {
//            return 2
//        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureValues[row]) °C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let degreeC = temperatureValues[row]
        let degreeF = converter.degreesFahrenheit(degreesCelsius: degreeC)
        temperatureLabel.text = "\(degreeF) °F"
        
        saveSelected(row: row)
        
        
    }

    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }
    
    
}
