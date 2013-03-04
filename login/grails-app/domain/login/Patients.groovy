package login

class Patients {

    String firstname
    String lastname
    String email_address
    String address
    String symptom
    String description
    String insurance_number
    Date   checkin

    Date    checkout
    String private_phone_number
    String work_phone_number
    String mobile_phone_number
  static hasMany = [medi: Medicaments,assura:Assurances,medecins:Medecins]
  static mappedBy = [medi: "medicaments",assura: "assurance", medecins: "medecins"]

    static mapping = {
//        groupSubscriptions joinTable: "Patients_Medicaments_s"
        assura joinTable: "Patients_Assurance_s"
        medecins joinTable: "Patients_Medecins_s"
    }


    String toString(){
        return firstname.trim() + ' ' + lastname.trim() + ' (' + email_address.trim() + ')'
    }
                       //test

    static constraints = {
        firstname()
        lastname()
        address()
        symptom()
        description()
        insurance_number()
        checkin()
        checkout()
        private_phone_number()
        work_phone_number()
        mobile_phone_number()
        email_address()

        firstname blank: false,nullable: false
        lastname blank: false,nullable: false
        address blank: false,nullable: false
        symptom blank: true,nullable: true
        description blank: true,nullable: true
        insurance_number blank:true,nullable: true
        checkin blank:false,nullable: false
        checkout blank:true
        private_phone_number blank: true, nullable: true
        work_phone_number blank: true,nullable: true
        mobile_phone_number blank: true,nullable: true
        email_address email :true  , blank: false

    }
}
