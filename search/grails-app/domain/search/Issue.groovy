package search

class Issue {


    String title
    String description
    String status
    String priority

    static searchable = {[only: 'title']
        title  spellCheck :'include'


     }
//static searchable = true

//    static searchable(){
//
//        only = ['title', 'description']
//        content: spellCheck 'include'
//    }

    static constraints = {
        title()
        description()
        status inList : ["UNASSIGNED", "ASSIGNED", "CLOSED"]
        priority inList: ["TRIVIAL", "MINOR", "MAJOR", "CRITICAL", "BLOCKER"]
    }


    String toString(){
        return title
    }

}




