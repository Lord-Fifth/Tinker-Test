import 'dart:io';

var mentors = new List();

class Test {
  var roles;
  var skills = new List();
  var time;

  //Stores the various available technical skills
  void addStacks() {
    print("Enter skill: ");
    var field = stdin.readLineSync();
    skills.add(field);
  }

  //Determines whether a participant is a learner or a mentor
  void setMentorOrLearner() {
    print("Enter designation\n1. Mentor\n2. Learner\nChoice: ");
    roles = stdin.readLineSync();
    if (roles.trim() == '1')
      roles = 'mentor';
    else if (roles.trim() == '2') roles = 'learner';
  }

  //Gets the available time of a mentor
  void setAvailableTime() {
    if (roles == 'mentor') {
      print("Enter the available time for this mentor in minutes : ");
      time = stdin.readByteSync();
    } else {
      print("This option is only for mentors\n");
    }
  }

  //Determines for a learner if a mentor is available based on skillset and time
  void getMentor(skills, check) {
    if (roles == 'learner') {
      bool flag = true;
      for (final interest in skills) {
        for (final mentor in mentors) {
          if (check <= mentor.time) {
            for (final skill in mentor.skills) {
              if (skill == interest) {
                print("Mentor found!\n");
                flag = false;
              }
            }
          }
        }
      }
      if (flag) {
        print("Mentor is not available!\n");
      }
    } else {
      print("This option is only for learners\n");
    }
  }
}

void main() {
  while (true) {
    Test obj = Test();
    obj.setMentorOrLearner();
    if (obj.roles == 'mentor') {
      print("Enter your top 3 skills\n");
      for (var i = 0; i < 3; ++i) {
        obj.addStacks();
      }
      obj.setAvailableTime();
      mentors.add(obj);
    } else if (obj.roles == 'learner') {
      print("Enter top 3 skills to be learnt\n");
      for (var i = 0; i < 3; ++i) {
        obj.addStacks();
      }
      print("Enter time: ");
      var time = stdin.readLineSync();
      obj.getMentor(obj.skills, time);
    }

    print("Do you want to exit?(Y/N)");
    String flag = stdin.readLineSync();
    flag = flag.toUpperCase();
    flag = flag.trim();
    if (flag == 'N') {
      exit(0);
    }
  }
}
