<%@ page import="search.Issue" %>



<div class="fieldcontain ${hasErrors(bean: issueInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="issue.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${issueInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: issueInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="issue.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${issueInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: issueInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="issue.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${issueInstance.constraints.status.inList}" value="${issueInstance?.status}" valueMessagePrefix="issue.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: issueInstance, field: 'priority', 'error')} ">
	<label for="priority">
		<g:message code="issue.priority.label" default="Priority" />
		
	</label>
	<g:select name="priority" from="${issueInstance.constraints.priority.inList}" value="${issueInstance?.priority}" valueMessagePrefix="issue.priority" noSelection="['': '']"/>
</div>

