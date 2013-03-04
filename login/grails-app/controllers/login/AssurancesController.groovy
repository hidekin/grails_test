package login

import org.springframework.dao.DataIntegrityViolationException

class AssurancesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [assurancesInstanceList: Assurances.list(params), assurancesInstanceTotal: Assurances.count()]
    }

    def create() {
        [assurancesInstance: new Assurances(params)]
    }

    def save() {
        def assurancesInstance = new Assurances(params)
        if (!assurancesInstance.save(flush: true)) {
            render(view: "create", model: [assurancesInstance: assurancesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'assurances.label', default: 'Assurances'), assurancesInstance.id])
        redirect(action: "show", id: assurancesInstance.id)
    }

    def show(Long id) {
        def assurancesInstance = Assurances.get(id)
        if (!assurancesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "list")
            return
        }

        [assurancesInstance: assurancesInstance]
    }

    def edit(Long id) {
        def assurancesInstance = Assurances.get(id)
        if (!assurancesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "list")
            return
        }

        [assurancesInstance: assurancesInstance]
    }

    def update(Long id, Long version) {
        def assurancesInstance = Assurances.get(id)
        if (!assurancesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (assurancesInstance.version > version) {
                assurancesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'assurances.label', default: 'Assurances')] as Object[],
                        "Another user has updated this Assurances while you were editing")
                render(view: "edit", model: [assurancesInstance: assurancesInstance])
                return
            }
        }

        assurancesInstance.properties = params

        if (!assurancesInstance.save(flush: true)) {
            render(view: "edit", model: [assurancesInstance: assurancesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'assurances.label', default: 'Assurances'), assurancesInstance.id])
        redirect(action: "show", id: assurancesInstance.id)
    }

    def delete(Long id) {
        def assurancesInstance = Assurances.get(id)
        if (!assurancesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "list")
            return
        }

        try {
            assurancesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assurances.label', default: 'Assurances'), id])
            redirect(action: "show", id: id)
        }
    }
}
