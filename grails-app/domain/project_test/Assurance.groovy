package project_test

class Assurance {
    String name
    Integer idnumber

    static hasMany = [assurance : Patients]
    static belongsTo = Patients

    static mapping = {
        // we can't have a table called group
        table "Assurance_"
        assurance joinTable: "Patients_Assurance_s"
    }

    String toString(){

        return name.trim()+'   '   +idnumber.toString().trim()+'   '


    }
    static constraints = {
    }
}
