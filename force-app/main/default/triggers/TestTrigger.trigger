trigger TestTrigger on Account (before insert) {
    List<Account> accList = [SELECT Name, Rating FROM Account];
    Map<String , String> newMap = new MAP< String , String>();
    for(Account a : accList){
        newMap.put(a.Name, a.Rating);
    }
    System.debug(newMap);
    for(Account acc:Trigger.New){
        if(newMap.get(acc.Name) == acc.Rating){
            acc.addError('Account with same Rating are not allowed');
        }
    }
}