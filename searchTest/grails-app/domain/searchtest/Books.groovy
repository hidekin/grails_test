package searchtest

class Books {
    String name
    Author author

    static searchable = {
        author component: [prefix: 'author']
    }

    static constraints = {
    }
}
