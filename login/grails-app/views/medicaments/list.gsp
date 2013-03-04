
<%@ page import="login.Medicaments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicaments.label', default: 'Medicaments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medicaments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medicaments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'medicaments.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="isbn" title="${message(code: 'medicaments.isbn.label', default: 'Isbn')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'medicaments.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="input_date" title="${message(code: 'medicaments.input_date.label', default: 'Inputdate')}" />
					
						<g:sortableColumn property="maturity_date" title="${message(code: 'medicaments.maturity_date.label', default: 'Maturitydate')}" />
					
						<g:sortableColumn property="weight" title="${message(code: 'medicaments.weight.label', default: 'Weight')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicamentsInstanceList}" status="i" var="medicamentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medicamentsInstance.id}">${fieldValue(bean: medicamentsInstance, field: "name")}</g:link></td>

                        <td>${fieldValue(bean: medicamentsInstance, field: "isbn")}</td>

                        <td>${fieldValue(bean: medicamentsInstance, field: "description")}</td>
					
						<td><g:formatDate date="${medicamentsInstance.input_date}" /></td>
					
						<td><g:formatDate date="${medicamentsInstance.maturity_date}" /></td>
					
						<td>${fieldValue(bean: medicamentsInstance, field: "weight")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicamentsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
