//
//  ViewController.swift
//  GenerateTextImage
//
//  Created by Vitor Mendes on 17/09/2018.
//  Copyright © 2018 br.com.sankhya.labs. All rights reserved.
//

import UIKit

extension String{
    //retorna uma string formatada como html
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)

        }catch{
            return NSAttributedString()
        }
    }
}

class ViewController: UIViewController {

    let imageTestView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let texto = "<html><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><meta charset='utf-8'/><center><h1>Texto de teste</h1></center><br><center><h1>Texto de teste</h1></center><br><center><h1>Texto de teste</h1></center><br><center><h1>Texto de teste</h1></center></html>".convertHtml()

        
        imageTestView.image = addTextToImage(text: texto, inImage: #imageLiteral(resourceName: "work1"), atPoint: CGPoint.zero)
        
        view.addSubview(imageTestView)
        imageTestView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
    
    }
    
    func addTextToImage(text: NSAttributedString, inImage: UIImage, atPoint:CGPoint) -> UIImage{
        
       
        
        // Cria um bitmap baseado na imagem
        UIGraphicsBeginImageContextWithOptions(inImage.size, false, 0.0)
        
        
        // Coloca a imagem em um retangulo do mesmo tamanho dela
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        // Cria o retangulo para o texto
        let textRect = CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height)
        // Coloca o texto no retangulo
        text.draw(in: textRect)
        
        // Pega a imagem
        let newImag = UIGraphicsGetImageFromCurrentImageContext()
        
        return newImag!
        
    }

}

