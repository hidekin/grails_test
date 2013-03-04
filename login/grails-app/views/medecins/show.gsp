
<%@ page import="login.Medecins" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medecins.label', default: 'Medecins')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medecins" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medecins" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medecins">
			
				<g:if test="${medecinsInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="medecins.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${medecinsInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="medecins.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${medecinsInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.phone_number}">
				<li class="fieldcontain">
					<span id="phone_number-label" class="property-label"><g:message code="medecins.phone_number.label" default="Phonenumber" /></span>
					
						<span class="property-value" aria-labelledby="phone_number-label"><g:fieldValue bean="${medecinsInstance}" field="phone_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.mobile_phone_number}">
				<li class="fieldcontain">
					<span id="mobile_phone_number-label" class="property-label"><g:message code="medecins.mobile_phone_number.label" default="Mobilephonenumber" /></span>
					
						<span class="property-value" aria-labelledby="mobile_phone_number-label"><g:fieldValue bean="${medecinsInstance}" field="mobile_phone_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.beeper_number}">
				<li class="fieldcontain">
					<span id="beeper_number-label" class="property-label"><g:message code="medecins.beeper_number.label" default="Beepernumber" /></span>
					
						<span class="property-value" aria-labelledby="beeper_number-label"><g:fieldValue bean="${medecinsInstance}" field="beeper_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.email_address}">
				<li class="fieldcontain">
					<span id="email_address-label" class="property-label"><g:message code="medecins.email_address.label" default="Emailaddress" /></span>
					
						<span class="property-value" aria-labelledby="email_address-label"><g:fieldValue bean="${medecinsInstance}" field="email_address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medecinsInstance?.medecins}">
				<li class="fieldcontain">
					<span id="medecins-label" class="property-label"><g:message code="medecins.medecins.label" default="Medecins" /></span>
					
						<g:each in="${medecinsInstance.medecins}" var="m">
						<span class="property-value" aria-labelledby="medecins-label"><g:link controller="patients" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${medecinsInstance?.id}" />
					<g:link class="edit" action="edit" id="${medecinsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
