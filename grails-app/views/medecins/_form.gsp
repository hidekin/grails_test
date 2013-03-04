<%@ page import="project_test.Medecins" %>



<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="medecins.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${medecinsInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="medecins.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${medecinsInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'phone_number', 'error')} required">
	<label for="phone_number">
		<g:message code="medecins.phone_number.label" default="Phonenumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="phone_number" type="number" value="${medecinsInstance.phone_number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'mobile_phone_number', 'error')} required">
	<label for="mobile_phone_number">
		<g:message code="medecins.mobile_phone_number.label" default="Mobilephonenumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mobile_phone_number" type="number" value="${medecinsInstance.mobile_phone_number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'beeper_number', 'error')} required">
	<label for="beeper_number">
		<g:message code="medecins.beeper_number.label" default="Beepernumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="beeper_number" type="number" value="${medecinsInstance.beeper_number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'email_address', 'error')} required">
	<label for="email_address">
		<g:message code="medecins.email_address.label" default="Emailaddress" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email_address" required="" value="${medecinsInstance?.email_address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medecinsInstance, field: 'medecins', 'error')} ">
	<label for="medecins">
		<g:message code="medecins.medecins.label" default="Medecins" />
		
	</label>
	
</div>

