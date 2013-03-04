package project_test

import org.springframework.dao.DataIntegrityViolationException

class AssuranceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [assuranceInstanceList: Assurance.list(params), assuranceInstanceTotal: Assurance.count()]
    }

    def create() {
        [assuranceInstance: new Assurance(params)]
    }

    def save() {
        def assuranceInstance = new Assurance(params)
        if (!assuranceInstance.save(flush: true)) {
            render(view: "create", model: [assuranceInstance: assuranceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'assurance.label', default: 'Assurance'), assuranceInstance.id])
        redirect(action: "show", id: assuranceInstance.id)
    }

    def show(Long id) {
        def assuranceInstance = Assurance.get(id)
        if (!assuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "list")
            return
        }

        [assuranceInstance: assuranceInstance]
    }

    def edit(Long id) {
        def assuranceInstance = Assurance.get(id)
        if (!assuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "list")
            return
        }

        [assuranceInstance: assuranceInstance]
    }

    def update(Long id, Long version) {
        def assuranceInstance = Assurance.get(id)
        if (!assuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (assuranceInstance.version > version) {
                assuranceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'assurance.label', default: 'Assurance')] as Object[],
                        "Another user has updated this Assurance while you were editing")
                render(view: "edit", model: [assuranceInstance: assuranceInstance])
                return
            }
        }

        assuranceInstance.properties = params

        if (!assuranceInstance.save(flush: true)) {
            render(view: "edit", model: [assuranceInstance: assuranceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'assurance.label', default: 'Assurance'), assuranceInstance.id])
        redirect(action: "show", id: assuranceInstance.id)
    }

    def delete(Long id) {
        def assuranceInstance = Assurance.get(id)
        if (!assuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "list")
            return
        }

        try {
            assuranceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assurance.label', default: 'Assurance'), id])
            redirect(action: "show", id: id)
        }
    }
}
