package login

import grails.test.mixin.*

@TestFor(MedicamentsController)
@Mock(Medicaments)
class MedicamentsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medicaments/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medicamentsInstanceList.size() == 0
        assert model.medicamentsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medicamentsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medicamentsInstance != null
        assert view == '/medicaments/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medicaments/show/1'
        assert controller.flash.message != null
        assert Medicaments.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medicaments/list'

        populateValidParams(params)
        def medicaments = new Medicaments(params)

        assert medicaments.save() != null

        params.id = medicaments.id

        def model = controller.show()

        assert model.medicamentsInstance == medicaments
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medicaments/list'

        populateValidParams(params)
        def medicaments = new Medicaments(params)

        assert medicaments.save() != null

        params.id = medicaments.id

        def model = controller.edit()

        assert model.medicamentsInstance == medicaments
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medicaments/list'

        response.reset()

        populateValidParams(params)
        def medicaments = new Medicaments(params)

        assert medicaments.save() != null

        // test invalid parameters in update
        params.id = medicaments.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medicaments/edit"
        assert model.medicamentsInstance != null

        medicaments.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medicaments/show/$medicaments.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medicaments.clearErrors()

        populateValidParams(params)
        params.id = medicaments.id
        params.version = -1
        controller.update()

        assert view == "/medicaments/edit"
        assert model.medicamentsInstance != null
        assert model.medicamentsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medicaments/list'

        response.reset()

        populateValidParams(params)
        def medicaments = new Medicaments(params)

        assert medicaments.save() != null
        assert Medicaments.count() == 1

        params.id = medicaments.id

        controller.delete()

        assert Medicaments.count() == 0
        assert Medicaments.get(medicaments.id) == null
        assert response.redirectedUrl == '/medicaments/list'
    }
}
