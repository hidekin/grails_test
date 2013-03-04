package project_test



import org.junit.*
import grails.test.mixin.*

@TestFor(MedecinsController)
@Mock(Medecins)
class MedecinsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medecins/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medecinsInstanceList.size() == 0
        assert model.medecinsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medecinsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medecinsInstance != null
        assert view == '/medecins/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medecins/show/1'
        assert controller.flash.message != null
        assert Medecins.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medecins/list'

        populateValidParams(params)
        def medecins = new Medecins(params)

        assert medecins.save() != null

        params.id = medecins.id

        def model = controller.show()

        assert model.medecinsInstance == medecins
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medecins/list'

        populateValidParams(params)
        def medecins = new Medecins(params)

        assert medecins.save() != null

        params.id = medecins.id

        def model = controller.edit()

        assert model.medecinsInstance == medecins
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medecins/list'

        response.reset()

        populateValidParams(params)
        def medecins = new Medecins(params)

        assert medecins.save() != null

        // test invalid parameters in update
        params.id = medecins.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medecins/edit"
        assert model.medecinsInstance != null

        medecins.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medecins/show/$medecins.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medecins.clearErrors()

        populateValidParams(params)
        params.id = medecins.id
        params.version = -1
        controller.update()

        assert view == "/medecins/edit"
        assert model.medecinsInstance != null
        assert model.medecinsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medecins/list'

        response.reset()

        populateValidParams(params)
        def medecins = new Medecins(params)

        assert medecins.save() != null
        assert Medecins.count() == 1

        params.id = medecins.id

        controller.delete()

        assert Medecins.count() == 0
        assert Medecins.get(medecins.id) == null
        assert response.redirectedUrl == '/medecins/list'
    }
}
