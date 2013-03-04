<%@ page import="login.Assurances" %>



<div class="fieldcontain ${hasErrors(bean: assurancesInstance, field: 'assurance', 'error')} ">
	<label for="assurance">
		<g:message code="assurances.assurance.label" default="Assurance" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: assurancesInstance, field: 'idnumber', 'error')} required">
	<label for="idnumber">
		<g:message code="assurances.idnumber.label" default="Idnumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idnumber" type="number" value="${assurancesInstance.idnumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: assurancesInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="assurances.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${assurancesInstance?.name}"/>
</div>

