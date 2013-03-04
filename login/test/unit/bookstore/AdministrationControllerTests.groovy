package bookstore



import org.junit.*
import grails.test.mixin.*

@TestFor(AdministrationController)
@Mock(Administration)
class AdministrationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/administration/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.administrationInstanceList.size() == 0
        assert model.administrationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.administrationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.administrationInstance != null
        assert view == '/administration/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/administration/show/1'
        assert controller.flash.message != null
        assert Administration.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/administration/list'

        populateValidParams(params)
        def administration = new Administration(params)

        assert administration.save() != null

        params.id = administration.id

        def model = controller.show()

        assert model.administrationInstance == administration
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/administration/list'

        populateValidParams(params)
        def administration = new Administration(params)

        assert administration.save() != null

        params.id = administration.id

        def model = controller.edit()

        assert model.administrationInstance == administration
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/administration/list'

        response.reset()

        populateValidParams(params)
        def administration = new Administration(params)

        assert administration.save() != null

        // test invalid parameters in update
        params.id = administration.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/administration/edit"
        assert model.administrationInstance != null

        administration.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/administration/show/$administration.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        administration.clearErrors()

        populateValidParams(params)
        params.id = administration.id
        params.version = -1
        controller.update()

        assert view == "/administration/edit"
        assert model.administrationInstance != null
        assert model.administrationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/administration/list'

        response.reset()

        populateValidParams(params)
        def administration = new Administration(params)

        assert administration.save() != null
        assert Administration.count() == 1

        params.id = administration.id

        controller.delete()

        assert Administration.count() == 0
        assert Administration.get(administration.id) == null
        assert response.redirectedUrl == '/administration/list'
    }
}
