<%@ page import="project_test.Assurance" %>



<div class="fieldcontain ${hasErrors(bean: assuranceInstance, field: 'assurance', 'error')} ">
	<label for="assurance">
		<g:message code="assurance.assurance.label" default="Assurance" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: assuranceInstance, field: 'idnumber', 'error')} required">
	<label for="idnumber">
		<g:message code="assurance.idnumber.label" default="Idnumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idnumber" type="number" value="${assuranceInstance.idnumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: assuranceInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="assurance.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${assuranceInstance?.name}"/>
</div>

