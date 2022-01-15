//
//  ViewController.swift
//  HomeWork10
//
//  Created by Владимир Данилович on 15.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonSet: UIButton!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var swich: UISwitch!
    @IBOutlet weak var buttonClear: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        textField.text = String(slider.value)
        progressView.progress = slider.value
    }

    @IBAction func textFieldAction(_ sender: UITextField) {
        slider.value = Float(textField.text ?? "") ?? 0.0
        progressView.progress = Float(textField.text ?? "") ?? 0.0
    }

    @IBAction func buttonSet(_ sender: UIButton) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale(identifier: "ru_RU")

        let timeValue = timeFormatter.string(from: datePicker.date)
        labelTime.text = timeValue
        swich.isOn = true
        labelTime.backgroundColor = .green
    }

    @IBAction func changeTime(_ sender: UIDatePicker) {
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        labelTime.backgroundColor = swich.isOn ? .green : .red
    }

    @IBAction func buttonClear(_ sender: Any) {
        labelTime.text = ""
        swich.isOn = false
    }

    func setupUI() {
        buttonSet.layer.cornerRadius = 20
        buttonClear.layer.cornerRadius = 20

        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .white
        slider.thumbTintColor = .yellow

        progressView.setProgress(0.0, animated: true)
    }
}

