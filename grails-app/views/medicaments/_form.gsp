<%@ page import="project_test.Medicaments" %>



<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="medicaments.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${medicamentsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="medicaments.isbn.label" default="Isbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="isbn" type="number" value="${medicamentsInstance.isbn}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="medicaments.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${medicamentsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'input_date', 'error')} required">
	<label for="input_date">
		<g:message code="medicaments.input_date.label" default="Inputdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="input_date" precision="day"  value="${medicamentsInstance?.input_date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'maturity_date', 'error')} required">
	<label for="maturity_date">
		<g:message code="medicaments.maturity_date.label" default="Maturitydate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="maturity_date" precision="day"  value="${medicamentsInstance?.maturity_date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="medicaments.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${medicamentsInstance.weight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="medicaments.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${medicamentsInstance.price}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'maker', 'error')} ">
	<label for="maker">
		<g:message code="medicaments.maker.label" default="Maker" />
		
	</label>
	<g:textField name="maker" value="${medicamentsInstance?.maker}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'medicaments', 'error')} ">
	<label for="medicaments">
		<g:message code="medicaments.medicaments.label" default="Medicaments" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: medicamentsInstance, field: 'subscribers', 'error')} ">
	<label for="subscribers">
		<g:message code="medicaments.subscribers.label" default="Subscribers" />
		
	</label>
	<g:select name="subscribers" from="${project_test.Patients.list()}" multiple="multiple" optionKey="id" size="5" value="${medicamentsInstance?.subscribers*.id}" class="many-to-many"/>
</div>

