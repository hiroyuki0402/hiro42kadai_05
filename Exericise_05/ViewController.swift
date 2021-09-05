//
//  ViewController.swift
//  Exericise_05
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private var textField01: UITextField!
    @IBOutlet private var textField02: UITextField!
    @IBOutlet private var resultLabel: UILabel!
    private var isCheck = true

    // MARK: METHODS
    @IBAction private func calculationButton(_ sender: Any) {
        updateLabel(targetLabel: resultLabel,
                    setString: calculate(textEntered01: textField01.text ?? "",
                                          textEntered02: textField02.text ?? ""))
    }

    private func checkingTheValue(checkPattern: CheckingPatternType,
                                  textEntered: String = "",
                                  alertTitle: String = "課題5",
                                  alertMsg: String,
                                  actionTitle: String = "OK") {
        let inputtedText = textEntered
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTitle, style: .default) { _ in
        }

        switch checkPattern {
        case .ifBlank:
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)

        case .ifNumbers:
            guard Double(inputtedText) != 0 else {
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                isCheck = false
                return
            }
        }
    }

    /// 計算処理 or アラート表示
    /// return: 計算結果 or 空白
    private func calculate(textEntered01: String, textEntered02: String) -> String {
        if textEntered01 != "" && textEntered02 != "" {
            // 空白ではなかった場合
            checkingTheValue(checkPattern: .ifNumbers,
                             textEntered: textEntered02,
                             alertMsg: AlertMessage.ifNumbers.rawValue)
            // 計算
            let result = atof(textEntered01) / atof(textEntered02)
            return  isCheck ? String(result) : ""
        } else {
            // 空白だった場合
            checkingTheValue(checkPattern: .ifBlank,
                             alertMsg: AlertMessage.ifBlank.rawValue)
            return ""
        }
    }
    private func updateLabel(targetLabel: UILabel, setString: String) {
        targetLabel.text = setString
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

public enum CheckingPatternType {
    case ifBlank,
         ifNumbers
}
public enum AlertMessage: String {
    case ifBlank = "割る数を入力してください",
         ifNumbers = "割る数には0を入力しないで下さい"
}
