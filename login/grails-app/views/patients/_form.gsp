<%@ page import="login.Patients" %>



<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="patients.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${patientsInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="patients.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${patientsInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="patients.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${patientsInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'symptom', 'error')} ">
	<label for="symptom">
		<g:message code="patients.symptom.label" default="Symptom" />
		
	</label>
	<g:textField name="symptom" value="${patientsInstance?.symptom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="patients.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${patientsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'insurance_number', 'error')} ">
	<label for="insurance_number">
		<g:message code="patients.insurance_number.label" default="Insurancenumber" />
		
	</label>
	<g:textField name="insurance_number" value="${patientsInstance?.insurance_number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'checkin', 'error')} required">
	<label for="checkin">
		<g:message code="patients.checkin.label" default="Checkin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkin" precision="day"  value="${patientsInstance?.checkin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'checkout', 'error')} required">
	<label for="checkout">
		<g:message code="patients.checkout.label" default="Checkout" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkout" precision="day"  value="${patientsInstance?.checkout}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'private_phone_number', 'error')} ">
	<label for="private_phone_number">
		<g:message code="patients.private_phone_number.label" default="Privatephonenumber" />
		
	</label>
	<g:textField name="private_phone_number" value="${patientsInstance?.private_phone_number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'work_phone_number', 'error')} ">
	<label for="work_phone_number">
		<g:message code="patients.work_phone_number.label" default="Workphonenumber" />
		
	</label>
	<g:textField name="work_phone_number" value="${patientsInstance?.work_phone_number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'mobile_phone_number', 'error')} ">
	<label for="mobile_phone_number">
		<g:message code="patients.mobile_phone_number.label" default="Mobilephonenumber" />
		
	</label>
	<g:textField name="mobile_phone_number" value="${patientsInstance?.mobile_phone_number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'email_address', 'error')} required">
	<label for="email_address">
		<g:message code="patients.email_address.label" default="Emailaddress" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email_address" required="" value="${patientsInstance?.email_address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'assura', 'error')} ">
	<label for="assura">
		<g:message code="patients.assura.label" default="Assura" />
		
	</label>
	<g:select name="assura" from="${login.Assurances.list()}" multiple="multiple" optionKey="id" size="5" value="${patientsInstance?.assura*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'medecins', 'error')} ">
	<label for="medecins">
		<g:message code="patients.medecins.label" default="Medecins" />
		
	</label>
	<g:select name="medecins" from="${login.Medecins.list()}" multiple="multiple" optionKey="id" size="5" value="${patientsInstance?.medecins*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientsInstance, field: 'medi', 'error')} ">
	<label for="medi">
		<g:message code="patients.medi.label" default="Medi" />
		
	</label>
	<g:select name="medi" from="${login.Medicaments.list()}" multiple="multiple" optionKey="id" size="5" value="${patientsInstance?.medi*.id}" class="many-to-many"/>
</div>

