/* Copyright (c) 2022 BlackBerry Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
 
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    /*
    Source: https://stackoverflow.com/questions/53119527/how-to-add-a-back-button-to-a-responsive-web-site-in-swift/53121339
    */
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let myURL = URL(string: "https://developers.blackberry.com/us/en")
        let myRequest = URLRequest(url: myURL!)
        self.webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItems =
                [ UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(goForward)),
                  UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(goBack))
            ]
    }
    
    @objc func goBack() {
        webView.goBack()
    }
    @objc func refreshButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func goForward() {
        webView.goForward()
    }
}
