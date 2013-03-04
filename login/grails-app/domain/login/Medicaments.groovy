package login

class Medicaments {

    String name
    String maker
    Integer isbn
    String description
    Date input_date
    Integer price
    Integer weight
    Date maturity_date


    static hasMany = [medicaments : Patients, subscribers: Patients]
    static belongsTo = Patients

    static mapping = {
//        we can't have a table called group
        table "Medicaments_"
        subscribers joinTable: "Patients_Medicaments_s"
    }





    String toString(){
        return name.trim() + ' ' + maker.trim()
    }

    static constraints = {
        name()
        isbn()
        description()
        input_date()
        maturity_date()
        weight()
        price()

        name blank: false,nullable: false
        isbn blank:false,nullable: false
        description blank: false,nullable: false
        input_date blank:false,nullable: false
        maturity_date blank:false,nullable: false
        weight scroll:false,blank:false,nullable: false
        price blank:false,nullable: false


    }
}

