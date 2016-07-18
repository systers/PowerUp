
//  CustomizeAvatar.swift

import UIKit



class CustomizeAvatar: UIViewController {
    
    
    var databasePath = NSString()
    //var absPath = NSString()
    @IBOutlet weak var customclothes: UIImageView!
    @IBOutlet weak var customhair: UIImageView!
    @IBOutlet weak var customface: UIImageView!
    @IBOutlet weak var customeyes: UIImageView!
    
    @IBOutlet weak var eyesview: UIImageView!
    var eyes = ["blue_eyes", "brown_eyes", "green_eyes","lightGreen_eyes","lightPink_eyes","grey_eyes","pink_eyes"]
    var eyescount = 0
    var eyestotal = 7
    @IBOutlet weak var faceview: UIImageView!
    var face = ["brick_face", "yellow_face",  "orange_face","peach_face"]
    var facecount = 0
    var facetotal = 4
    @IBOutlet weak var hairview: UIImageView!
    var hair = ["hair2", "hair3", "hair4", "hair5", "hair6", "hair7", "hair8", "hair9", "hair10", "hair11"]
    var haircount = 0
    var hairtotal = 10
    @IBOutlet weak var clothesview: UIImageView!
    var clothes = ["cloth1", "cloth2", "cloth3", "cloth4", "cloth5", "cloth6", "cloth7", "cloth8", "cloth9"]
    var clothescount = 0
    var clothestotal = 9
    override func viewDidLoad() {
        super.viewDidLoad()

        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        
        databasePath = docsDir.stringByAppendingPathComponent(
            "contacts.db")
        
        if !filemgr.fileExistsAtPath(databasePath as String) {
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB == nil {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        }
        
        eyesview.image = UIImage(named: "\(eyes[eyescount]).png")
        hairview.image = UIImage(named: "\(hair[haircount]).png")
        clothesview.image = UIImage(named: "\(clothes[clothescount]).png")
        faceview.image = UIImage(named: "\(face[facecount]).png")
        
        customeyes.image = UIImage(named: "\(eyes[eyescount]).png")
        customclothes.image = UIImage(named: "\(clothes[clothescount]).png")
        customface.image = UIImage(named: "\(face[facecount]).png")
        customhair.image = UIImage(named: "\(hair[haircount]).png")
        
        
    }
 //   @IBAction func saveData(sender: AnyObject) {}
            
            
            
            
            
            
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
          }
    
   
   
    @IBAction func clothesR(sender: AnyObject) {
        if(clothescount + 1 < clothestotal){
            clothescount++
        }
        clothesview.image = UIImage(named: "\(clothes[clothescount]).png")
        customclothes.image = UIImage(named: "\(clothes[clothescount]).png")
    }
    
    @IBAction func clothesL(sender: AnyObject) {
        if(clothescount > 0){
            clothescount--
        }
        clothesview.image = UIImage(named: "\(clothes[clothescount]).png")
        customclothes.image = UIImage(named: "\(clothes[clothescount]).png")
    }
    
    @IBAction func hairR(sender: AnyObject) {
        
        if(haircount + 1 < hairtotal){
            haircount++
        }
        hairview.image = UIImage(named: "\(hair[haircount]).png")
        customhair.image = UIImage(named: "\(hair[haircount]).png")
        
        
    }
    @IBAction func hairL(sender: AnyObject) {
        if(haircount > 0){
            haircount--
        }
        hairview.image = UIImage(named: "\(hair[haircount]).png")
        customhair.image = UIImage(named: "\(hair[haircount]).png")
      
    }
    @IBAction func faceR(sender: AnyObject) {
        if(facecount + 1 < facetotal){
            facecount++
        }
        faceview.image = UIImage(named: "\(face[facecount]).png")
        customface.image = UIImage(named: "\(face[facecount]).png")
    }
    
    @IBAction func faceL(sender: AnyObject) {
        if(facecount  > 0){
            facecount--
        }
        faceview.image = UIImage(named: "\(face[facecount]).png")
        customface.image = UIImage(named: "\(face[facecount]).png")
    }
    
    @IBAction func eyesR(sender: AnyObject) {
        if(eyescount + 1 < eyestotal){
            eyescount++
        }
        eyesview.image = UIImage(named: "\(eyes[eyescount]).png")
        customeyes.image = UIImage(named: "\(eyes[eyescount]).png")
    }
    @IBAction func eyesL(sender: AnyObject) {
        if(eyescount  > 0){
            eyescount--
        }
        eyesview.image = UIImage(named: "\(eyes[eyescount]).png")
        customeyes.image = UIImage(named: "\(eyes[eyescount]).png")
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstMap"
        {
            if let destinationVC = segue.destinationViewController as? MapScreen  {
                
                destinationVC.eyeImage = eyesview.image
                destinationVC.hairImage = hairview.image
                destinationVC.clothesImage = clothesview.image
                destinationVC.faceImage = faceview.image
            }
            
            
        }
        println("This is printed when you reach Map from DR1!")
        
        
        
        
        // Fetching database content via FMDB wrapper
        
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        var error: NSError?
        
        databasePath = docsDir.stringByAppendingPathComponent(
            "mainDatabase.sqlite")
        
        
        if filemgr.fileExistsAtPath(databasePath as String){
            println("FOUND!!!!")
            filemgr.removeItemAtPath(databasePath as String, error: &error)
        }
       
        
       if let bundle_path = NSBundle.mainBundle().pathForResource("mainDatabase", ofType: "sqlite"){
            println("Bundle path:\(bundle_path)")
            println(" ")
            if filemgr.copyItemAtPath(bundle_path, toPath: databasePath as String, error: &error){
                println("Success in copying from bundle to databasepath")
                println("Database path: \(databasePath)")
                println(" ")

            }
            else{
                println("Failure 1")
                println(error?.localizedDescription)
            }
        
        
         let mainDB = FMDatabase(path: databasePath as String) 
        if mainDB.open(){
            
            //let query = "INSERT INTO Avatar (Face, Clothes, Hair, Eyes) VALUES ('brick_face', 'cloth1', 'hair10', 'grey_eyes')"
            
            let query = "INSERT INTO Avatar (Face, Clothes, Hair, Eyes) VALUES ('\(face[facecount])', '\(clothes[clothescount])', '\(hair[haircount])', '\(eyes[eyescount])')"
              let addSuccess = mainDB.executeUpdate(query, withArgumentsInArray: nil)
            if(!addSuccess){
                println("Failed to add data to Avatar Table")
            }
            else
            {
                print("Success....")
            }
       
       
        if filemgr.fileExistsAtPath(bundle_path){
            println("About to del bundle file")
            filemgr.removeItemAtPath(bundle_path, error: &error)
            
        }
        
        if filemgr.copyItemAtPath(databasePath as String, toPath: bundle_path, error: &error){
            println("replaced bundle path contents")
            
        }
        else{
            println("Failure 2")
            println(error?.localizedDescription)
        }

        }
        mainDB.close()
    
        }
}
}