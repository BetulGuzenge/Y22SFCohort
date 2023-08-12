
===> Here is the Anonymous Class code <===

try {
    StudentMarks sm = new StudentMarks();
    sm.validateMarks(-10);

} catch(StudentMarks.MarksException sme){
    system.debug('marks exception: ' + sme);
}
 catch (Exception ex) {
    system.debug('general exception: ' + ex);
}