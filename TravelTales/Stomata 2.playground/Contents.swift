import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit


// Introduction
class InitialPageViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addBackground(imageName: "Explore")
        loadButton()
    }
    
    func loadButton() {
        let myButton = UIButton(type: .system)
        
        myButton.frame =
            CGRect(x: 320, y: 420, width: 125, height: 60)

        myButton.setTitle("Let's Explore!", for: .normal)
        myButton.tintColor = UIColor.black
        myButton.titleLabel?.textColor = .white
        myButton.backgroundColor = UIColor.yellow
        myButton.titleEdgeInsets = UIEdgeInsets(top: 3, left: 12, bottom: 3, right: 12)
        myButton.addTarget(self, action: #selector(btnLetsExplore_clicked(_:)), for: .touchUpInside)
        view.addSubview(myButton)
    }
    
    @objc func btnLetsExplore_clicked(_ sender: UIButton) {
        self.navigationController?.pushViewController(Introduction(), animated: true)
    }
}

class Introduction: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        loadIntroducationLabel()
        loadGuideImage()
        loadStudentInfo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            self.navigationController?.pushViewController(ForgotToWearMask(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func loadGuideImage() {
        let imageView = UIImageView(image: UIImage(named: "INTRODUCTION"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 40, y: 350, width: 200, height: 200)
        view.addSubview(imageView)
    }
    
    func loadIntroducationLabel() {
        let label = UILabel()
      
        label.frame = CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width - 30, height: 40)
        
        let attributedString = NSMutableAttributedString()
        
        let info = "In 2007, More Than 100 Million People Voted to Declare the New Seven Wonders of the World. This was done to preserve the global heritage that seems to be forgotten and We are about to seek those forgotten masterpieces which are scattered all over the world. Don't forget to tap on the images you see to learn more!"

        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 30)]

        let firstString = NSMutableAttributedString(string: "ℹ️ About the quest:", attributes: firstAttributes)
        let secondAttributedString = NSAttributedString(string: " \n\(info)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedString.append(firstString)
        attributedString.append(secondAttributedString)
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
    }
    
    func loadStudentInfo() {
        let label = UILabel()
        label.frame = CGRect(x: 300, y: 350, width: 350, height: 40)
        label.text = "Hello! You can call me Atri, I will be your guide today. I will accompany you throughout the journey."
     
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
        
    }
}

class ForgotToWearMask: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        safetyLabel()
        loadMaskGuideImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.navigationController?.pushViewController(MyViewController(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func loadMaskGuideImage() {
        let imageView = UIImageView(image: UIImage(named: "Mask"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 40, y: 350, width: 200, height: 200)

        
        view.addSubview(imageView)
    }
    
    func safetyLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width - 30, height: 40)
        
        let attributedString = NSMutableAttributedString()
        
        let info = "I forgot to wear a mask. Wearing a mask while heading outdoors is necessary. You should also always have one on while heading out too! This is not only for your safety but also to ensure the safety of people around you as well. "

        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 30)]

        let firstString = NSMutableAttributedString(string: "OOPS‼️", attributes: firstAttributes)
        let secondAttributedString = NSAttributedString(string: " \n\(info)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedString.append(firstString)
        attributedString.append(secondAttributedString)
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
    }
}

class PlaceDetail: UIViewController {
    var arrPlaceInfo = [[String: Any]]()
    var headerTitle = String()
    var placeDescription = String()

    let label = UILabel()
    let lblTitle = UILabel()
    let imageView = UIImageView()
    
    override func loadView() {
        view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {

        arrPlaceInfo = [
            ["title": "📍Chichen Itza, Mexico 🇲🇽", "description": "One of the world's most famous archaeological sites, Chichen Itza is an ancient Mayan city full of many sacred buildings depicting the genius and adaptability of Mayan Culture. The city not only acted as a political hub but also was the economic capital of the Mayan Civilisation. El Castillo (Spanish for 'the castle'), is widely known as the Temple of Kukulcan, is a Meso-American Pyramid that dominates the center of the Chichen Itza and is one of the most influential ruins from the City. The structure is 30 m high, 24 is the height of the pyramid plus an additional 6 m for the temple at the top. The last construction probably took place between 900-1000 AD, while the substructure may have been constructed earlier, between 600-800 AD. Based on archaeological research, the construction of Kukulkan was based on the concept of axis Mundi.","imgName": #imageLiteral(resourceName: "ChichenItza.png") ],

            ["title": "📍Christ De Redemeer, Brazil 🇧🇷", "description": "The statue of Christ the Redeemer has become a symbolic protector for the people of Brazil. It is located at the peak of Corcovado Mountain in the Tijuca National forest overlooking the city of Rio De Janeiro. The construction lasted for about 9 years,1922-1931. The statue is 30 meters high, excluding its 8 meters pedestal. The arms stretch 28 meters wide. It is also the 5th largest statue in the world.", "imgName":#imageLiteral(resourceName: "ChristDeRedemeer.png")],
            ["title": "📍Machu Picchu, Peru 🇵🇪", "description": "Machu Picchu was an astronomical observatory, and its sacred Intihuatana stone accurately indicates the two equinoxes. Twice a year, the sun sits directly over the stone creating no shadow, located in the Eastern Cordillera of southern Peru, on a 2,430-metre mountain ridge.Although known locally, it was not known to the Spanish during  the colonial period and remained unknown to the outside  world until  an American historian brought  it to the international  attention in 1911. It is believed to have been built in 1450s and  was also recognzied as a UNESCO World Heritage Site in the year  1983.", "imgName": #imageLiteral(resourceName: "MachuPicchu.png")],
            ["title": "📍Petra, Jordan 🇯🇴", "description": "Often referred to as the “Rose City” and also as “Lost City”, you might recognize this wonderful place from the famous movie Indiana Jones and the Last Crusade released in the year 1989. The city could be built possibly as early as the 5th century BC and was spotted by the world for the first time in 1812. The city's carved rose-red sandstone rock facades, tombs, and temples are not only the most visited tourist attraction in Jordan but also one of the most visited archeological sites in the world.", "imgName": #imageLiteral(resourceName: "Petra.png")],
            ["title": "📍Colosseum, Italy 🇮🇹", "description": "The Colosseum is an oval-shaped amphitheater in the city of Rome and is also the largest amphitheater in the world. Built Between 70-80 a.d., It Was in Use for Some 500 Years. The Elliptical Structure, able to fit nearly 50,000 Spectators, used to gather to watch the gladiatorial events as well as other public spectacles, including battle reenactments, animal hunts, and executions. Unfortunately, earthquakes and stone-robbers have left the Colosseum in a state of ruin, but portions of the structure remain open to tourists, and its design still influences the construction of modern-day amphitheaters, some 2,000 years later.","imgName": #imageLiteral(resourceName: "Coloseeum.png")],
            ["title": "📍Taj Mahal, India 🇮🇳", "description": "Namaste! Welcome to the land of love. The White Marble Structure Represents several Architectural Styles, Including Persian, Islamic, Turkish, and Indian. The Taj Mahal also encompasses Formal Gardens of Raised Pathways, Sunken flower beds, and a linear reflecting pool located in the city of Agra near the banks of the Yamuna River. It was commissioned in 1632 by the Mughal Emperor Shah Jahan to house the tomb of his favorite wife, Mumtaz Mahal, it also houses the tomb of Shah Jahan himself.The Taj Mahal was designated as a UNESCO World Heritage site in 1983. It is regarded by many as the best example of Mughal architecture and a symbol of India's rich history.","imgName": #imageLiteral(resourceName: "TajMahal.png")],
            ["title":  "📍Great wall of China, China 🇨🇳", "description": "Welcome to the world’s longest man-made structure! Built Between the 5th-16th Centuries B.C. by different dynasties over multiple courses, the Great Wall of China is a Stone-and-earth Fortification Created to protect the Borders of the Chinese Empire From invading Mongols. Apart from defense, other purposes of the Great Wall have included border controls, allowing the imposition of duties on goods transported along the Silk Road, regulation or encouragement of trade, and the control of immigration and emigration. The Great Wall is a succession of multiple walls spanning Approximately 4,000 Miles.","imgName": #imageLiteral(resourceName: "GreatWallOfChina.png")]
        ]

        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        loadDescriptionLabel()
        loadWonderImage()
    }
    
    func setData() {
        let arrTitle = arrPlaceInfo.compactMap({($0["title"] as? String)})
        if arrTitle.contains(headerTitle) {
            if let index = arrTitle.firstIndex(of: headerTitle) {
                placeDescription  = arrPlaceInfo[index]["description"] as? String  ?? ""
                label.text = placeDescription
            }
        }
    }

    func loadWonderImage() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.width - 20, height: 300)
        view.addSubview(imageView)

    }

    func loadDescriptionLabel() {

        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 30, height: 300)
        

        lblTitle.frame = CGRect(x: 20, y: 450, width: UIScreen.main.bounds.width - 10, height: 40)
        label.frame = CGRect(x: 20, y: 500, width: UIScreen.main.bounds.width - 30, height: 40)
        let arrTitle = arrPlaceInfo.compactMap({($0["title"] as? String)})
        if arrTitle.contains(headerTitle) {
            if let index = arrTitle.firstIndex(of: headerTitle) {
                placeDescription  = arrPlaceInfo[index]["description"] as? String  ?? ""
                imageView.image = arrPlaceInfo[index]["imgName"] as? UIImage
                lblTitle.text = arrPlaceInfo[index]["title"] as? String ?? ""
                label.text = placeDescription
            }
        }
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        
        lblTitle.textColor = .white
        lblTitle.numberOfLines = 0
        lblTitle.font = .boldSystemFont(ofSize: 30)
        
        view.addSubview(lblTitle)
        view.addSubview(label)
        view.addSubview(imageView)
    }
}

//QUIZ

extension UIView {
    func addBackground(imageName: String) {

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 10, width: width, height: height))
    imageViewBackground.image = UIImage(named: imageName)
    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFit

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
        


}}
struct Question {
    let text: String
    let answer: String
    let option: String
    
    init(q: String, a: String, b: String) {
        text = q
        answer = a
        option = b
    }
}

struct TravelQuiz {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [Question(q: "How many wonders are there in the world?", a: "7", b: "8"), Question(q: "What you should always carry with you while travelling?", a: "Mask", b: "Excess gadgets"),  Question(q: "Where is Taj Mahal located?", a: "India", b: "China"), Question(q: "Which one of the following is the world's largest man-made structure?", a: "Great wall of China", b: "Colosseum")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getAnsText() -> String {
        return quiz[questionNumber].answer
    }
    
    func getOptionText() -> String {
        return quiz[questionNumber].option
    }
    
    func getProgress() ->  Float  {
        return Float(questionNumber) / Float(quiz.count)
    }
   
    mutating func getScore() -> Int {
        return score
    }
    mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count  {
            questionNumber +=  1
        }
    }

    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
           score += 1
            return true
        } else {
            return false
        }
        
}
    

}

class QuizVC: UIViewController {
    var questionLabel = UILabel()
    var progressBar = UIProgressView()
    var option1 = UIButton()
    var option2 = UIButton()
    var scoreLabel = UILabel()
    var questionCount = 0
    var travelQuiz = TravelQuiz()
    
    override func loadView() {
        view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
     
        option1.frame = CGRect(x: 250, y: 250, width:200 , height: 30)
        option1.setTitleColor(.black, for: .normal)
        option1.addTarget(self, action: #selector(answerButtonPressed(_:)), for: .touchUpInside)
        
        questionLabel.frame = CGRect(x: 165, y: 50, width: UIScreen.main.bounds.width - 80, height: 200)
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 0

        scoreLabel.frame = CGRect(x:20, y: 50, width: 100, height: 50)
        scoreLabel.textColor = .white
        
        option2.frame = CGRect(x: 250, y: 300, width: 200, height: 30)
        option2.setTitleColor(.black, for: .normal)
        option2.addTarget(self, action: #selector(answerButtonPressed(_:)), for: .touchUpInside)
        
        progressBar.frame = CGRect(x: 30, y: 650, width: 700, height: 30)
        view.addSubview(option1)
        view.addSubview(option2)
        view.addSubview(progressBar)
        view.addSubview(questionLabel)
        view.addSubview(scoreLabel)
        updateUI()
        option1.backgroundColor = UIColor.white
        

    }
   
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let  userAnswer = sender.currentTitle!
        
        let  userGotItRight = travelQuiz.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor =  UIColor.red
        }
        
        travelQuiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI) , userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        questionCount += 1
        if questionCount == 5 {
            self.navigationController?.pushViewController(PostQuiz(), animated: true)
        } else {
            questionLabel.text = travelQuiz.getQuestionText()
            option1.setTitle(travelQuiz.getAnsText(), for: .normal)
            option2.setTitle(travelQuiz.getOptionText(), for: .normal)
            progressBar.progress = travelQuiz.getProgress()
            scoreLabel.text = "Score: \(travelQuiz.getScore())"
            
            option1.backgroundColor = .white
            option2.backgroundColor = .white
        }
    }
}

//Collection View
class MyCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    let image = UIImageView()
    
    override func awakeFromNib() {
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        image.frame = CGRect(x: 10, y: 10, width: self.frame.width, height: self.frame.height)
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.black.cgColor
        
        label.frame =  CGRect(x: 20, y: 90, width: 200, height: 60)
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        self.addSubview(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
class MyViewController : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var headerView: UIView!
    var titleLabel: UILabel!
    var selView: UIView!
    var selLabel: UILabel!
    var collectionView: UICollectionView!
    var arrPlaceInfo = [[String: Any]]()


    var numberSelected = 0

    override func loadView() {
        view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "7 WONDERS OF THE WORLD"
        self.navigationController?.navigationBar.isHidden = false
        let button = UIBarButtonItem(title: "Quiz", style: .plain, target: self, action: #selector(btnNext))
        
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func btnNext() {
        self.navigationController?.pushViewController(PreQuiz(), animated: true)
    }
    
    override func viewDidLayoutSubviews() {

        setupHeader()
        setupCollection()
        arrPlaceInfo = [["title": "📍Chichen Itza, Mexico 🇲🇽", "imgName": #imageLiteral(resourceName: "ChichenItza.png") ],
                    ["title": "📍Christ De Redemeer, Brazil 🇧🇷", "imgName":#imageLiteral(resourceName: "ChristDeRedemeer.png")],
                    ["title": "📍Machu Picchu, Peru 🇵🇪", "imgName": #imageLiteral(resourceName: "MachuPicchu.png")],
                    ["title": "📍Petra, Jordan 🇯🇴", "imgName": #imageLiteral(resourceName: "Petra.png")],
                    ["title": "📍Colosseum, Italy 🇮🇹", "imgName": #imageLiteral(resourceName: "Coloseeum.png")],
                    ["title": "📍Taj Mahal, India 🇮🇳", "imgName": #imageLiteral(resourceName: "TajMahal.png")],
                    ["title":  "📍Great wall of China, China 🇨🇳", "imgName": #imageLiteral(resourceName: "GreatWallOfChina.png")]]
        collectionView?.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPlaceInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 200.0)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        let place = arrPlaceInfo[indexPath.row]
        cell.label.text = place["title"] as? String ?? ""
        cell.image.image = place["imgName"] as? UIImage
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PlaceDetail()
        vc.headerTitle = arrPlaceInfo[indexPath.row]["title"] as? String ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func setupHeader() {
        headerView = UIView()
        headerView.backgroundColor = .white

        titleLabel = UILabel()
        titleLabel.text = "Update"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 25)
        headerView.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    }

    func setupCollection() {
        let frame = self.view.frame
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.allowsMultipleSelection = true
        view.addSubview(collectionView)
        collectionView.reloadData()
    }

    func setupStack() {
        let stackView = UIStackView(arrangedSubviews: [headerView, collectionView!, selView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let headHeight = headerView.heightAnchor.constraint(equalToConstant: 50)
        let selHeight = selView.heightAnchor.constraint(equalToConstant: 50)
        stackView.addConstraints([headHeight, selHeight])

        view.addSubview(stackView)

        let sH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["stackView":stackView])
        let sV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stackView]-30-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: ["stackView":stackView])
        view.addConstraints(sH)
        view.addConstraints(sV)
    }
}

class PreQuiz: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        quizIntroducationLabel()
        loadImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.navigationController?.pushViewController(QuizVC(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func loadImage() {
        let imageView = UIImageView(image: UIImage(named: "Thinking"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 40, y: 300, width: 200, height: 200)
        view.addSubview(imageView)
    }
    
    func quizIntroducationLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 60, width: UIScreen.main.bounds.width - 30, height: 40)
        
        let attributedString = NSMutableAttributedString()
        
        let info = "A quiz is waiting for you, let’s put the knowledge you have mustered from the places you visited to a test! Good luck, I hope you get all of them right :) "

        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 30)]

        let firstString = NSMutableAttributedString(string: "🚨 QUIZ ALERT 🚨", attributes: firstAttributes)
        let secondAttributedString = NSAttributedString(string: " \n\(info)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedString.append(firstString)
        attributedString.append(secondAttributedString)
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
    }
    
    
}
//End
class PostQuiz: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(imageName: "Scroll")
        congratulations()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
        
    func congratulations() {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width - 30, height: 40)
        
        let attributedString = NSMutableAttributedString()
        
        let info = "You’ve managed to take a glimpse of all the 7 wonders of the world and now are also ready to take on the challenges that you will face when you’ll travel again in real life."

        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.brown, .font: UIFont.boldSystemFont(ofSize: 30)]

        let firstString = NSMutableAttributedString(string: "🎉 YAYYY 🎉", attributes: firstAttributes)
        let secondAttributedString = NSAttributedString(string: " \n\(info)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.brown])
        attributedString.append(firstString)
        attributedString.append(secondAttributedString)
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
    }
    
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController: InitialPageViewController())

   

