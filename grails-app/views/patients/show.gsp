
<%@ page import="project_test.Patients" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patients.label', default: 'Patients')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patients" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patients" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patients">
			
				<g:if test="${patientsInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="patients.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${patientsInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="patients.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${patientsInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="patients.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${patientsInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.symptom}">
				<li class="fieldcontain">
					<span id="symptom-label" class="property-label"><g:message code="patients.symptom.label" default="Symptom" /></span>
					
						<span class="property-value" aria-labelledby="symptom-label"><g:fieldValue bean="${patientsInstance}" field="symptom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="patients.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${patientsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.insurance_number}">
				<li class="fieldcontain">
					<span id="insurance_number-label" class="property-label"><g:message code="patients.insurance_number.label" default="Insurancenumber" /></span>
					
						<span class="property-value" aria-labelledby="insurance_number-label"><g:fieldValue bean="${patientsInstance}" field="insurance_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.checkin}">
				<li class="fieldcontain">
					<span id="checkin-label" class="property-label"><g:message code="patients.checkin.label" default="Checkin" /></span>
					
						<span class="property-value" aria-labelledby="checkin-label"><g:formatDate date="${patientsInstance?.checkin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.checkout}">
				<li class="fieldcontain">
					<span id="checkout-label" class="property-label"><g:message code="patients.checkout.label" default="Checkout" /></span>
					
						<span class="property-value" aria-labelledby="checkout-label"><g:formatDate date="${patientsInstance?.checkout}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.private_phone_number}">
				<li class="fieldcontain">
					<span id="private_phone_number-label" class="property-label"><g:message code="patients.private_phone_number.label" default="Privatephonenumber" /></span>
					
						<span class="property-value" aria-labelledby="private_phone_number-label"><g:fieldValue bean="${patientsInstance}" field="private_phone_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.work_phone_number}">
				<li class="fieldcontain">
					<span id="work_phone_number-label" class="property-label"><g:message code="patients.work_phone_number.label" default="Workphonenumber" /></span>
					
						<span class="property-value" aria-labelledby="work_phone_number-label"><g:fieldValue bean="${patientsInstance}" field="work_phone_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.mobile_phone_number}">
				<li class="fieldcontain">
					<span id="mobile_phone_number-label" class="property-label"><g:message code="patients.mobile_phone_number.label" default="Mobilephonenumber" /></span>
					
						<span class="property-value" aria-labelledby="mobile_phone_number-label"><g:fieldValue bean="${patientsInstance}" field="mobile_phone_number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.email_address}">
				<li class="fieldcontain">
					<span id="email_address-label" class="property-label"><g:message code="patients.email_address.label" default="Emailaddress" /></span>
					
						<span class="property-value" aria-labelledby="email_address-label"><g:fieldValue bean="${patientsInstance}" field="email_address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.assura}">
				<li class="fieldcontain">
					<span id="assura-label" class="property-label"><g:message code="patients.assura.label" default="Assura" /></span>
					
						<g:each in="${patientsInstance.assura}" var="a">
						<span class="property-value" aria-labelledby="assura-label"><g:link controller="assurance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.medecins}">
				<li class="fieldcontain">
					<span id="medecins-label" class="property-label"><g:message code="patients.medecins.label" default="Medecins" /></span>
					
						<g:each in="${patientsInstance.medecins}" var="m">
						<span class="property-value" aria-labelledby="medecins-label"><g:link controller="medecins" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${patientsInstance?.medi}">
				<li class="fieldcontain">
					<span id="medi-label" class="property-label"><g:message code="patients.medi.label" default="Medi" /></span>
					
						<g:each in="${patientsInstance.medi}" var="m">
						<span class="property-value" aria-labelledby="medi-label"><g:link controller="medicaments" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${patientsInstance?.id}" />
					<g:link class="edit" action="edit" id="${patientsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
