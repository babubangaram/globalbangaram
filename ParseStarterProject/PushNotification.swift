
import Foundation

class PushNotication {
    
    class func parsePushUserAssign() {
        let installation = PFInstallation.current()
        installation[PF_INSTALLATION_USER] = PFUser.current()
        
        installation.saveInBackground { (succeeded, error) in
         //        installation.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
            
            if error != nil {
                print("parsePushUserAssign save error.")
            }
        }
    }
    
    class func parsePushUserResign() {
        var installation = PFInstallation.current()
        installation.remove(forKey: PF_INSTALLATION_USER)
        installation.saveInBackground { (succeeded, error) in
            
            if error != nil {
                print("parsePushUserResign save error")
            }
        }
    }
    
//    class func sendPushNotification(groupId: String, text: String) {
//        var query = PFQuery(className: PF_MESSAGES_CLASS_NAME)
//        query.whereKey(PF_MESSAGES_GROUPID, equalTo: groupId)
//        query.whereKey(PF_MESSAGES_USER, equalTo: PFUser.currentUser())
//        query.includeKey(PF_MESSAGES_USER)
//        query.limit = 1000
//        
//        var installationQuery = PFInstallation.query()
//        installationQuery.whereKey(PF_INSTALLATION_USER, matchesKey: PF_MESSAGES_USER, inQuery: query)
//        
//        var push = PFPush()
//        push.setQuery(installationQuery)
//        push.setMessage(text)
//        push.sendPushInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
//            if error != nil {
//                println("sendPushNotification error")
//            }
//        }
//    }
//    
}
