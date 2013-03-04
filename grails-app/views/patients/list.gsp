
<%@ page import="project_test.Patients" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patients.label', default: 'Patients')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patients" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-patients" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstname" title="${message(code: 'patients.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'patients.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'patients.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="symptom" title="${message(code: 'patients.symptom.label', default: 'Symptom')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'patients.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="insurance_number" title="${message(code: 'patients.insurance_number.label', default: 'Insurancenumber')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patientsInstanceList}" status="i" var="patientsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patientsInstance.id}">${fieldValue(bean: patientsInstance, field: "firstname")}</g:link></td>
					
						<td>${fieldValue(bean: patientsInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: patientsInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: patientsInstance, field: "symptom")}</td>
					
						<td>${fieldValue(bean: patientsInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: patientsInstance, field: "insurance_number")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patientsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
