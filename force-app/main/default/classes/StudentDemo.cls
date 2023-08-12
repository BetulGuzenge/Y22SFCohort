public class StudentDemo {

    integer age;
    public StudentDemo() {
        age = 18;
    }
    public StudentDemo(Integer age) {
        if(age < 18){
            throw new AgeException('Age cannot be less than 18. Only adult students allowed.');
        } else {
            this.age = age;
        }
    }
    public void show(){
        system.debug('age of student is ' + age);
    }
}