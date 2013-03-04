
<%@ page import="login.Assurances" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assurances.label', default: 'Assurances')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-assurances" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-assurances" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list assurances">
			
				<g:if test="${assurancesInstance?.assurance}">
				<li class="fieldcontain">
					<span id="assurance-label" class="property-label"><g:message code="assurances.assurance.label" default="Assurance" /></span>
					
						<g:each in="${assurancesInstance.assurance}" var="a">
						<span class="property-value" aria-labelledby="assurance-label"><g:link controller="patients" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${assurancesInstance?.idnumber}">
				<li class="fieldcontain">
					<span id="idnumber-label" class="property-label"><g:message code="assurances.idnumber.label" default="Idnumber" /></span>
					
						<span class="property-value" aria-labelledby="idnumber-label"><g:fieldValue bean="${assurancesInstance}" field="idnumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assurancesInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="assurances.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${assurancesInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${assurancesInstance?.id}" />
					<g:link class="edit" action="edit" id="${assurancesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
