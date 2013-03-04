
<%@ page import="login.Medecins" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medecins.label', default: 'Medecins')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medecins" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medecins" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstname" title="${message(code: 'medecins.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'medecins.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="phone_number" title="${message(code: 'medecins.phone_number.label', default: 'Phonenumber')}" />
					
						<g:sortableColumn property="mobile_phone_number" title="${message(code: 'medecins.mobile_phone_number.label', default: 'Mobilephonenumber')}" />
					
						<g:sortableColumn property="beeper_number" title="${message(code: 'medecins.beeper_number.label', default: 'Beepernumber')}" />
					
						<g:sortableColumn property="email_address" title="${message(code: 'medecins.email_address.label', default: 'Emailaddress')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medecinsInstanceList}" status="i" var="medecinsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medecinsInstance.id}">${fieldValue(bean: medecinsInstance, field: "firstname")}</g:link></td>
					
						<td>${fieldValue(bean: medecinsInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: medecinsInstance, field: "phone_number")}</td>
					
						<td>${fieldValue(bean: medecinsInstance, field: "mobile_phone_number")}</td>
					
						<td>${fieldValue(bean: medecinsInstance, field: "beeper_number")}</td>
					
						<td>${fieldValue(bean: medecinsInstance, field: "email_address")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medecinsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
