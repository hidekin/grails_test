
<%@ page import="login.Medicaments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicaments.label', default: 'Medicaments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medicaments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medicaments" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medicaments">
			
				<g:if test="${medicamentsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="medicaments.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${medicamentsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="medicaments.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${medicamentsInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="medicaments.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${medicamentsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.input_date}">
				<li class="fieldcontain">
					<span id="input_date-label" class="property-label"><g:message code="medicaments.input_date.label" default="Inputdate" /></span>
					
						<span class="property-value" aria-labelledby="input_date-label"><g:formatDate date="${medicamentsInstance?.input_date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.maturity_date}">
				<li class="fieldcontain">
					<span id="maturity_date-label" class="property-label"><g:message code="medicaments.maturity_date.label" default="Maturitydate" /></span>
					
						<span class="property-value" aria-labelledby="maturity_date-label"><g:formatDate date="${medicamentsInstance?.maturity_date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="medicaments.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${medicamentsInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="medicaments.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${medicamentsInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.maker}">
				<li class="fieldcontain">
					<span id="maker-label" class="property-label"><g:message code="medicaments.maker.label" default="Maker" /></span>
					
						<span class="property-value" aria-labelledby="maker-label"><g:fieldValue bean="${medicamentsInstance}" field="maker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.medicaments}">
				<li class="fieldcontain">
					<span id="medicaments-label" class="property-label"><g:message code="medicaments.medicaments.label" default="Medicaments" /></span>
					
						<g:each in="${medicamentsInstance.medicaments}" var="m">
						<span class="property-value" aria-labelledby="medicaments-label"><g:link controller="patients" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentsInstance?.subscribers}">
				<li class="fieldcontain">
					<span id="subscribers-label" class="property-label"><g:message code="medicaments.subscribers.label" default="Subscribers" /></span>
					
						<g:each in="${medicamentsInstance.subscribers}" var="s">
						<span class="property-value" aria-labelledby="subscribers-label"><g:link controller="patients" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${medicamentsInstance?.id}" />
					<g:link class="edit" action="edit" id="${medicamentsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
