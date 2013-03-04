package login

import org.compass.core.engine.SearchEngineQueryParseException
import org.springframework.dao.DataIntegrityViolationException

class PatientsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static String WILDCARD = "*"
    def searchableService


    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String searchTerm = WILDCARD+ params.q + WILDCARD
            return [searchResult: Country.search(searchTerm, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }


    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [patientsInstanceList: Patients.list(params), patientsInstanceTotal: Patients.count()]
    }

    def create() {
        [patientsInstance: new Patients(params)]
    }

    def save() {
        def patientsInstance = new Patients(params)
        if (!patientsInstance.save(flush: true)) {
            render(view: "create", model: [patientsInstance: patientsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'patients.label', default: 'Patients'), patientsInstance.id])
        redirect(action: "show", id: patientsInstance.id)
    }

    def show(Long id) {
        def patientsInstance = Patients.get(id)
        if (!patientsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "list")
            return
        }

        [patientsInstance: patientsInstance]
    }

    def edit(Long id) {
        def patientsInstance = Patients.get(id)
        if (!patientsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "list")
            return
        }

        [patientsInstance: patientsInstance]
    }

    def update(Long id, Long version) {
        def patientsInstance = Patients.get(id)
        if (!patientsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (patientsInstance.version > version) {
                patientsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patients.label', default: 'Patients')] as Object[],
                          "Another user has updated this Patients while you were editing")
                render(view: "edit", model: [patientsInstance: patientsInstance])
                return
            }
        }

        patientsInstance.properties = params

        if (!patientsInstance.save(flush: true)) {
            render(view: "edit", model: [patientsInstance: patientsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'patients.label', default: 'Patients'), patientsInstance.id])
        redirect(action: "show", id: patientsInstance.id)
    }

    def delete(Long id) {
        def patientsInstance = Patients.get(id)
        if (!patientsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "list")
            return
        }

        try {
            patientsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patients.label', default: 'Patients'), id])
            redirect(action: "show", id: id)
        }
    }
}
