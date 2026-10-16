class Student {
  final int id;
  final String email;
  final String password;

  Student({
    required this.id,
    required this.email,
    required this.password,
  });
}

Student? currentStudent;

List<Student> students = [
  Student(id: 1, email: 'student1@students.asu.edu.jo', password: 'P@ssw0rd'),
  Student(id: 2, email: 'student2@students.asu.edu.jo', password: 'P@ssw0rd'),
  Student(id: 3, email: 'student3@students.asu.edu.jo', password: 'P@ssw0rd'),
];

void addStudent(String email, String password) {
  students
      .add(Student(id: students.length + 1, email: email, password: password));
}

Student? authenticateStudent(String email, String password) {
  for (var student in students) {
    if (student.email == email && student.password == password) {
      return student;
    }
  }
  return null;
}

bool isStudentRegistered(String email) {
  for (var student in students) {
    if (student.email == email) {
      return true;
    }
  }
  return false;
}
