//
//  ViewController2.swift
//  Exericise_05
//
//  Created by akio0911 on 2021/09/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private var textField1: UITextField!
    @IBOutlet private var textField2: UITextField!
    @IBOutlet private var resultLabel: UILabel!

    // MARK: METHODS
    @IBAction private func calculationButton(_ sender: Any) {
        calculate(textEntered01: textField1.text ?? "",
                  textEntered02: textField2.text ?? "")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // 異常値のチェック・計算・ラベル表示に専念するメソッド
    private func calculate(textEntered01: String, textEntered02: String) {
        guard let number1 = Double(textEntered01) else {
            presentAlert(message: "割られる数を入力してください")
            return
        }

        guard let number2 = Double(textEntered02) else {
            presentAlert(message: "割る数を入力してください")
            return
        }

        guard number2 != 0 else {
            presentAlert(message: "割る数には0を入力しないで下さい")
            return
        }

        resultLabel.text = String(number1 / number2)
    }

    // アラート表示に専念するメソッド
    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "課題5",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
