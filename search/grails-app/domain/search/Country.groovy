package search

class Country {
    String name
    static hasMany = [cities:City]
    static constraints = {
    }
    static searchable = {[only: 'name']
}
}