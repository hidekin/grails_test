package search

class City {
    static belongsTo = Country
    Country  country
    String name

    static constraints = {
    }
}
