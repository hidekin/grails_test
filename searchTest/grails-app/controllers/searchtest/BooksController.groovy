package searchtest

import org.springframework.dao.DataIntegrityViolationException

class BooksController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def resultTotal
    result = searchableService.search(params.q, params)
    [
    resultList: result.results,
    resultsTotal: result.total
    ]
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [booksInstanceList: Books.list(params), booksInstanceTotal: Books.count()]
    }

    def create() {
        [booksInstance: new Books(params)]
    }

    def save() {
        def booksInstance = new Books(params)
        if (!booksInstance.save(flush: true)) {
            render(view: "create", model: [booksInstance: booksInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'books.label', default: 'Books'), booksInstance.id])
        redirect(action: "show", id: booksInstance.id)
    }

    def show(Long id) {
        def booksInstance = Books.get(id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "list")
            return
        }

        [booksInstance: booksInstance]
    }

    def edit(Long id) {
        def booksInstance = Books.get(id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "list")
            return
        }

        [booksInstance: booksInstance]
    }

    def update(Long id, Long version) {
        def booksInstance = Books.get(id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (booksInstance.version > version) {
                booksInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'books.label', default: 'Books')] as Object[],
                        "Another user has updated this Books while you were editing")
                render(view: "edit", model: [booksInstance: booksInstance])
                return
            }
        }

        booksInstance.properties = params

        if (!booksInstance.save(flush: true)) {
            render(view: "edit", model: [booksInstance: booksInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'books.label', default: 'Books'), booksInstance.id])
        redirect(action: "show", id: booksInstance.id)
    }

    def delete(Long id) {
        def booksInstance = Books.get(id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "list")
            return
        }

        try {
            booksInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'books.label', default: 'Books'), id])
            redirect(action: "show", id: id)
        }
    }
}
