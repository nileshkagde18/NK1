trigger test on Account (after update) {
    list <Account> acclist = new list <Account>();
acclist= trigger.new;
system.debug(acclist);

}