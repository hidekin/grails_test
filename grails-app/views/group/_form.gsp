<%@ page import="project_test.Group" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="group.members.label" default="Members" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="group.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${groupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'subscribers', 'error')} ">
	<label for="subscribers">
		<g:message code="group.subscribers.label" default="Subscribers" />
		
	</label>
	
</div>

