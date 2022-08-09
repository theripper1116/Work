List<sbaa__Approver__c> listOfApproverRecordGroupId = [Select Name, sbaa__GroupId__c from sbaa__Approver__c where sbaa__GroupId__c != null];
Set<String> listOfApproverRecordGroupIdList = new Set<String>();
for(sbaa__Approver__c a: listOfApproverRecordGroupId){
    listOfApproverRecordGroupIdList.add(a.Name);
}
List<Group> groupName = [Select Name, Id from Group where Name IN: listOfApproverRecordGroupIdList];

MAP<String, Id> mapForGroupName = new MAP<String, Id>();
for(Group a: groupName){
    mapForGroupName.put(a.Name, a.Id);
}

List<sbaa__Approver__c> updateList = new List<sbaa__Approver__c>();
for(sbaa__Approver__c a: listOfApproverRecordGroupId){
    a.sbaa__GroupId__c = mapForGroupName.get(a.Name);
    updateList.add(a);
}

update updateList;
