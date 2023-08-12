studentDemo s= new StudentDemo();
s.show();

StudentDemo s1= new StudentDemo(15);
s1.show();


system.debug('----');

try {
   studentDemo s1 = new StudentDemo(15);
    s1.show(); 
} catch (AgeException ae) {
   system.debug('age went wrong buddy') ;
}