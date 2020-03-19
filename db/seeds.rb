
h1 = Hospital.create(name:"Haps")
h2 = Hospital.create(name:"Awes")
h3 = Hospital.create(name:"Games")

d1 = Doctor.create(name:"Luke")
d2 = Doctor.create(name:"Ben")
d3 = Doctor.create(name:"Han")

n1 = Nurse.create(name:"Sandy",hospital_id: h1.id)
n2 = Nurse.create(name:"Jen",hospital_id: h2.id)
n3 = Nurse.create(name:"Bill",hospital_id: h3.id)

alex = Patient.create(doctor_id: d1.id, hospital_id: h1.id, name:"Alex",nurse_id: n1.id)
mike = Patient.create(doctor_id: d2.id, hospital_id: h2.id,name:"Mike",nurse_id: n2.id)
john = Patient.create(doctor_id: d3.id, hospital_id: h3.id,name:"John",nurse_id: n3.id)











