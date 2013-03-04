package project_test

import org.springframework.dao.DataIntegrityViolationException

class MedecinsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medecinsInstanceList: Medecins.list(params), medecinsInstanceTotal: Medecins.count()]
    }

    def create() {
        [medecinsInstance: new Medecins(params)]
    }

    def save() {
        def medecinsInstance = new Medecins(params)
        if (!medecinsInstance.save(flush: true)) {
            render(view: "create", model: [medecinsInstance: medecinsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'medecins.label', default: 'Medecins'), medecinsInstance.id])
        redirect(action: "show", id: medecinsInstance.id)
    }

    def show(Long id) {
        def medecinsInstance = Medecins.get(id)
        if (!medecinsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "list")
            return
        }

        [medecinsInstance: medecinsInstance]
    }

    def edit(Long id) {
        def medecinsInstance = Medecins.get(id)
        if (!medecinsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "list")
            return
        }

        [medecinsInstance: medecinsInstance]
    }

    def update(Long id, Long version) {
        def medecinsInstance = Medecins.get(id)
        if (!medecinsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medecinsInstance.version > version) {
                medecinsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'medecins.label', default: 'Medecins')] as Object[],
                        "Another user has updated this Medecins while you were editing")
                render(view: "edit", model: [medecinsInstance: medecinsInstance])
                return
            }
        }

        medecinsInstance.properties = params

        if (!medecinsInstance.save(flush: true)) {
            render(view: "edit", model: [medecinsInstance: medecinsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medecins.label', default: 'Medecins'), medecinsInstance.id])
        redirect(action: "show", id: medecinsInstance.id)
    }

    def delete(Long id) {
        def medecinsInstance = Medecins.get(id)
        if (!medecinsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "list")
            return
        }

        try {
            medecinsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medecins.label', default: 'Medecins'), id])
            redirect(action: "show", id: id)
        }
    }
}
