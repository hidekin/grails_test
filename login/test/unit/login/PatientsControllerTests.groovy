package login

import grails.test.mixin.*

@TestFor(PatientsController)
@Mock(Patients)
class PatientsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/patients/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.patientsInstanceList.size() == 0
        assert model.patientsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.patientsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.patientsInstance != null
        assert view == '/patients/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/patients/show/1'
        assert controller.flash.message != null
        assert Patients.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/patients/list'

        populateValidParams(params)
        def patients = new Patients(params)

        assert patients.save() != null

        params.id = patients.id

        def model = controller.show()

        assert model.patientsInstance == patients
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/patients/list'

        populateValidParams(params)
        def patients = new Patients(params)

        assert patients.save() != null

        params.id = patients.id

        def model = controller.edit()

        assert model.patientsInstance == patients
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/patients/list'

        response.reset()

        populateValidParams(params)
        def patients = new Patients(params)

        assert patients.save() != null

        // test invalid parameters in update
        params.id = patients.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/patients/edit"
        assert model.patientsInstance != null

        patients.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/patients/show/$patients.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        patients.clearErrors()

        populateValidParams(params)
        params.id = patients.id
        params.version = -1
        controller.update()

        assert view == "/patients/edit"
        assert model.patientsInstance != null
        assert model.patientsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/patients/list'

        response.reset()

        populateValidParams(params)
        def patients = new Patients(params)

        assert patients.save() != null
        assert Patients.count() == 1

        params.id = patients.id

        controller.delete()

        assert Patients.count() == 0
        assert Patients.get(patients.id) == null
        assert response.redirectedUrl == '/patients/list'
    }
}
