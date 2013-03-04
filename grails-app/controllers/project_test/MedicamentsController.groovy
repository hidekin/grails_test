package project_test

import org.springframework.dao.DataIntegrityViolationException

class MedicamentsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medicamentsInstanceList: Medicaments.list(params), medicamentsInstanceTotal: Medicaments.count()]
    }

    def create() {
        [medicamentsInstance: new Medicaments(params)]
    }

    def save() {
        def medicamentsInstance = new Medicaments(params)
        if (!medicamentsInstance.save(flush: true)) {
            render(view: "create", model: [medicamentsInstance: medicamentsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), medicamentsInstance.id])
        redirect(action: "show", id: medicamentsInstance.id)
    }

    def show(Long id) {
        def medicamentsInstance = Medicaments.get(id)
        if (!medicamentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "list")
            return
        }

        [medicamentsInstance: medicamentsInstance]
    }

    def edit(Long id) {
        def medicamentsInstance = Medicaments.get(id)
        if (!medicamentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "list")
            return
        }

        [medicamentsInstance: medicamentsInstance]
    }

    def update(Long id, Long version) {
        def medicamentsInstance = Medicaments.get(id)
        if (!medicamentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medicamentsInstance.version > version) {
                medicamentsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'medicaments.label', default: 'Medicaments')] as Object[],
                        "Another user has updated this Medicaments while you were editing")
                render(view: "edit", model: [medicamentsInstance: medicamentsInstance])
                return
            }
        }

        medicamentsInstance.properties = params

        if (!medicamentsInstance.save(flush: true)) {
            render(view: "edit", model: [medicamentsInstance: medicamentsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), medicamentsInstance.id])
        redirect(action: "show", id: medicamentsInstance.id)
    }

    def delete(Long id) {
        def medicamentsInstance = Medicaments.get(id)
        if (!medicamentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "list")
            return
        }

        try {
            medicamentsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medicaments.label', default: 'Medicaments'), id])
            redirect(action: "show", id: id)
        }
    }
}
