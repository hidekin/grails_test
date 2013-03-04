<%@ page import="project_test.Test" %>



<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="test.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${testInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'test', 'error')} ">
	<label for="test">
		<g:message code="test.test.label" default="Test" />
		
	</label>
	
</div>

