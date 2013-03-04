package login

import grails.test.mixin.*

@TestFor(AssurancesController)
@Mock(Assurances)
class AssurancesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assurances/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assurancesInstanceList.size() == 0
        assert model.assurancesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.assurancesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assurancesInstance != null
        assert view == '/assurances/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assurances/show/1'
        assert controller.flash.message != null
        assert Assurances.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assurances/list'

        populateValidParams(params)
        def assurances = new Assurances(params)

        assert assurances.save() != null

        params.id = assurances.id

        def model = controller.show()

        assert model.assurancesInstance == assurances
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assurances/list'

        populateValidParams(params)
        def assurances = new Assurances(params)

        assert assurances.save() != null

        params.id = assurances.id

        def model = controller.edit()

        assert model.assurancesInstance == assurances
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assurances/list'

        response.reset()

        populateValidParams(params)
        def assurances = new Assurances(params)

        assert assurances.save() != null

        // test invalid parameters in update
        params.id = assurances.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assurances/edit"
        assert model.assurancesInstance != null

        assurances.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assurances/show/$assurances.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assurances.clearErrors()

        populateValidParams(params)
        params.id = assurances.id
        params.version = -1
        controller.update()

        assert view == "/assurances/edit"
        assert model.assurancesInstance != null
        assert model.assurancesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assurances/list'

        response.reset()

        populateValidParams(params)
        def assurances = new Assurances(params)

        assert assurances.save() != null
        assert Assurances.count() == 1

        params.id = assurances.id

        controller.delete()

        assert Assurances.count() == 0
        assert Assurances.get(assurances.id) == null
        assert response.redirectedUrl == '/assurances/list'
    }
}
