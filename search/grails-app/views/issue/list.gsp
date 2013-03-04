
<%@ page import="search.Issue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <g:form url='[controller: "issue", action: "search"]' id="searchableForm" name="searchableForm" method="get">
        <g:textField name="q" value="${params.q}" /> <input type="submit" value="Search" />
    </g:form>

		<a href="#list-issue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-issue" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'issue.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'issue.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'issue.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'issue.priority.label', default: 'Priority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${issueInstanceList}" status="i" var="issueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${issueInstance.id}">${fieldValue(bean: issueInstance, field: "title").capitalize()}</g:link></td>
					
						<td>${fieldValue(bean: issueInstance, field: "description").capitalize()}</td>
                        %{--todo capitalize the others label--}%
					
						<td>${fieldValue(bean: issueInstance, field: "status").capitalize()}</td>
					
						<td>${fieldValue(bean: issueInstance, field: "priority").capitalize()}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${issueInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
