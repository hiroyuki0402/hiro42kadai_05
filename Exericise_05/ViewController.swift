//
//  ViewController.swift
//  Exericise_05
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private var textField1: UITextField!
    @IBOutlet private var textField2: UITextField!
    @IBOutlet private var resultLabel: UILabel!
    private var isCheck = true

    // MARK: METHODS
    @IBAction private func calculationButton(_ sender: Any) {
        isCheck = true

        resultLabel.text = calculate(textEntered01: textField1.text ?? "",
                                     textEntered02: textField2.text ?? "")
    }

    private func checkingTheValue(checkPatternAndAlertMsg: String,
                                  textEntered: String = "",
                                  alertTitle: String = "課題5",
                                  actionTitle: String = "OK") {
        let checkingTextEntered = textEntered
        let alert = UIAlertController(title: alertTitle,
                                      message: checkPatternAndAlertMsg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTitle, style: .default)

        guard Double(checkingTextEntered) != 0 else {
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            isCheck = false
            return
        }

        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    /// 計算処理 or アラート表示
    /// return: 計算結果 or 空白
    private func calculate(textEntered01: String, textEntered02: String) -> String {
        if textEntered01 != "" && textEntered02 != "" {
            // 空白ではなかった場合且つ数字のチェック
            checkingTheValue(checkPatternAndAlertMsg: "割る数には0を入力しないで下さい",
                             textEntered: textEntered02)
            // 計算
            let result = Double(textEntered01)! / Double(textEntered02)!
            return  isCheck ? String(result) : ""
        } else {
            // 空白だった場合
            checkingTheValue(checkPatternAndAlertMsg: "割る数を入力してください")
            return ""
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
