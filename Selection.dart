import 'dart:io';

List<Test> mentors = [];

class Test {

  var roles;
  var skills = [];
  int time; 

  void addStacks() {

    print("Enter skill: ");
    var field = stdin.readLineSync();
    skills.add(field);
  }

  void setMentorOrLearner() {

    stdout.writeln("Enter designation:\n1. Mentor\n2. Learner");
    var choice = int.parse(stdin.readLineSync());

    if(choice == 1) 
      roles = 'mentor';
    else if(choice == 2) 
      roles = 'learner';
    else {
      print("Invalid choice");
      exit(0);
    }
  }

  void setAvailableTime() {

    if(roles == 'mentor') {
      stdout.writeln("Enter the available time in minutes:");
      time = int.parse(stdin.readLineSync());
    }
    else
      print("This is not available for Learners.");
  }

  void getMentor(interests, check) {

    if(roles == 'learner') {
      bool flag = true;
      for(var i in interests) {
        for(var mentor in mentors) {
          if(check <= mentor.time) {
            for(var fields in mentor.skills) {
              if(fields == i) {
                flag = false;
                print("Mentor found for $i");
              }
            }
          }
        }
      }

      if(flag)
        print("No Mentor available.");
    }
    else
      print("This is not available for Mentors.");
  }
}

void main() {

  while(true) {

    Test obj = Test();
    obj.setMentorOrLearner();
    if(obj.roles == 'mentor') {

      print("Enter area of expertise");
      for(var i = 0; i < 3; i++) {
        obj.addStacks();
      }
      obj.setAvailableTime();
      mentors.add(obj);
    }
    else {

      print("Enter area of interest");
      for(var i = 0; i < 3; i++) {
        obj.addStacks();
      }
      stdout.writeln("Enter time slot:");
      int time = int.parse(stdin.readLineSync());

      obj.getMentor(obj.skills, time);
    }


    print("Do you want to exit?(Y/N)");
    String flag = stdin.readLineSync();
    flag = flag.toUpperCase().trim();
    if (flag == 'Y') {
      exit(0);
    }
  }
}