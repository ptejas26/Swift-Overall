
import Foundation
import UIKit

class FirstVC: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
    }

    @IBAction func buttonAction() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let viewController = sb.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
