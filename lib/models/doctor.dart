class Doctor {
  final int id;
  final String name;
  final String specialty;
  final String imageURL;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageURL,
  });
}

List<Doctor> doctors = [
  Doctor(
    id: 1,
    name: "Dr. Sarah Smith",
    specialty: "Cardiologist",
    imageURL:
        "https://media.istockphoto.com/id/1371998919/photo/cropped-portrait-of-an-attractive-young-female-doctor-giving-thumbs-up-while-working-in-her.jpg?s=612x612&w=0&k=20&c=5oPD2p5gc7ZQjgyjPAJui9eOGKF8sK_GG6MJpYXmA7s=",
  ),
  Doctor(
    id: 2,
    name: "Dr. John Doe",
    specialty: "Dermatologist",
    imageURL:
        "https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg",
  ),
  Doctor(
    id: 3,
    name: "Dr. Emily Brown",
    specialty: "Pediatrician",
    imageURL: "https://www.freestock.com/450/freestock_41742406.jpg",
  ),
  Doctor(
    id: 4,
    name: "Dr. Khalid Tawil",
    specialty: "Otorhinolaryngologist",
    imageURL:
        "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGRvY3RvcnxlbnwwfHwwfHx8MA%3D%3D",
  )
];
