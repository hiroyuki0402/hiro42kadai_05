//
//  ViewController.swift
//  Exericise_05
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var textField01: UITextField!
    @IBOutlet var textField02: UITextField!
    @IBOutlet var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func calculationButton(_ sender: Any) {
        
        
        guard let val01 = textField01.text as NSString? else { alert(message: "割る数を入力してください")
            return
        }
        let newVal01 = val01.doubleValue
        
        guard let val02 = textField02.text as NSString? else { alert(message: "割る数を入力してください")
            return
        }
        let newVal02 = val02.doubleValue

        if newVal02 == 0{
            alert(message: "割るかずには0を入力しないで下さい")
            return
        }

        let result = newVal01 / newVal02
    
        resultLabel.text = String(result)
        //メモ
        //String(format:"%.3f", )桁数を3桁で表示
    }
    
    private func alert(AcTitel:String = "課題5",message:String,actionTitle:String = "OK"){
        let alert = UIAlertController(title: AcTitel, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTitle, style: .default) { okAction in
            self.textField02.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func delegate(){
        textField01.delegate = self
        textField02.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

