EnumExample.Season s1= EnumExample.Season.SUMMER;// here we are assigning one value which is summer to enum
EnumExample e1 = new EnumExample();
e1.show(s1);

e1.show(EnumExample.Season.values());


system.debug ('------------');
e1.show (EnumExample.Season.FALL);
e1.show (EnumExample.Season.WINTER);
e1.show (EnumExample.Season.SPRING);// ANYTHING ELSE RATHER THAN THESE 4 VALUES IS NOT EXCEPTED. It is a kind og retricted picklist


Assignment1enum.Weekday w1 = Assignment1enum.Weekday.Monday;
Assignment1enum.Weekend w2 = Assignment1enum.Weekend.Sunday;
Assignment1enum a1 = new Assignment1enum();
a1.show(w1, w2);