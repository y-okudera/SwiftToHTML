//
//  ViewController.swift
//  SwiftToHTML
//
//  Created by Yuki Okudera on 2019/10/25.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Vaux
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = String.documentsDir() + "/"
        print("directory", path)
        
        let name = "testing"
        self.output(destinationDir: path, htmlName: name)
    }
}

extension ViewController {
    
    /// output
    /// - Parameter destinationDir: directory/
    /// - Parameter htmlName: output file name
    private func output(destinationDir: String, htmlName: String) {
        let vaux = Vaux()
//        vaux.outputLocation = .stdout
        vaux.outputLocation = .file(name: htmlName, path: destinationDir)
        do {
            let html = simplePage()
            try vaux.render(html)
        } catch {
            print("Uh-oh, something happened: \(error.localizedDescription)")
        }
    }
    
    private func simplePage() -> HTML {
        return html {
            head {
                "SwiftToHTML"
            }
            body {
                heading(.h1) {
                    "SwiftでHTMLを生成"
                }
                
                image(url: "http://www.bonoanime.jp/images/bonochan/08s.png")
                
                div {
                    paragraph {
                        "Vauxを使用して、"
                    }
                    .attr("style", "color:#FF0000")
                    
                    paragraph {
                        "htmlファイルを生成する。"
                    }
                }
                
                div {
                    "center"
                }
                .alignment(.center)
            }
            .backgroundColor("#F0F8FF")
            .attr("text", "#4B0082")
        }
    }
}

extension String {
    
    /// Documents directory
    static func documentsDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
}
