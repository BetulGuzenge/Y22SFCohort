public class StudentMarks {
    public class MarksException extends exception{}

    public void validateMarks(integer marks){
        if (marks == null) {
            throw new MarksException('Invalid Mark');
        } else if(marks > 100){
             throw new MarksException('Marks can’t be more than 100');
        } else if(marks < 0){
             throw new MarksException('Marks cannot be negative');
        } else {
            system.debug('all good. Marks are : ' + marks);
        }
    }
}
