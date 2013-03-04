package project_test

class Medecins {

    static hasMany = [medecins : Patients]
    static belongsTo = Patients

    static mapping = {
        // we can't have a table called group
        table "Medecins_"
        medecins joinTable: "Patients_Medecins_s"
    }

    String firstname
    String lastname
    String email_address
    Integer phone_number
    Integer mobile_phone_number
    Integer beeper_number









    String toString(){

          return firstname.trim().capitalize() +' ' + lastname.trim() + ' (' + email_address.trim() + ')'
      }



    static constraints = {
        firstname()
        lastname()
        phone_number()
        mobile_phone_number()
        beeper_number()
        email_address()

        email_address email: true ,  blank: false
        firstname blank: false
        lastname blank: false
        phone_number blank: false

    }
}
