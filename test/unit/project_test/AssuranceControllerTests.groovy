package project_test



import org.junit.*
import grails.test.mixin.*

@TestFor(AssuranceController)
@Mock(Assurance)
class AssuranceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assurance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assuranceInstanceList.size() == 0
        assert model.assuranceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.assuranceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assuranceInstance != null
        assert view == '/assurance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assurance/show/1'
        assert controller.flash.message != null
        assert Assurance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assurance/list'

        populateValidParams(params)
        def assurance = new Assurance(params)

        assert assurance.save() != null

        params.id = assurance.id

        def model = controller.show()

        assert model.assuranceInstance == assurance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assurance/list'

        populateValidParams(params)
        def assurance = new Assurance(params)

        assert assurance.save() != null

        params.id = assurance.id

        def model = controller.edit()

        assert model.assuranceInstance == assurance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assurance/list'

        response.reset()

        populateValidParams(params)
        def assurance = new Assurance(params)

        assert assurance.save() != null

        // test invalid parameters in update
        params.id = assurance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assurance/edit"
        assert model.assuranceInstance != null

        assurance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assurance/show/$assurance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assurance.clearErrors()

        populateValidParams(params)
        params.id = assurance.id
        params.version = -1
        controller.update()

        assert view == "/assurance/edit"
        assert model.assuranceInstance != null
        assert model.assuranceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assurance/list'

        response.reset()

        populateValidParams(params)
        def assurance = new Assurance(params)

        assert assurance.save() != null
        assert Assurance.count() == 1

        params.id = assurance.id

        controller.delete()

        assert Assurance.count() == 0
        assert Assurance.get(assurance.id) == null
        assert response.redirectedUrl == '/assurance/list'
    }
}
