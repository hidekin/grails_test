<%@ page import="project_test.Assurance; project_test.Medicaments; project_test.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groupSubscriptions', 'error')} ">
	<label for="groupSubscriptions">
		<g:message code="user.groupSubscriptions.label" default="Group Subscriptions" />
		
	</label>
	<g:select name="groupSubscriptions" from="${Medicaments.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.groupSubscriptions*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="user.groups.label" default="Groups" />
		
	</label>
	<g:select name="groups" from="${Medicaments.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.groups*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'test', 'error')} ">
	<label for="test">
		<g:message code="user.test.label" default="Test" />
		
	</label>
	<g:select name="test" from="${Assurance.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.test*.id}" class="many-to-many"/>
</div>

