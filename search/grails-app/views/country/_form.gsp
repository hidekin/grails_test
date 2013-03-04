<%@ page import="search.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'cities', 'error')} ">
	<label for="cities">
		<g:message code="country.cities.label" default="Cities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.cities?}" var="c">
    <li><g:link controller="city" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="city" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'city.label', default: 'City')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${countryInstance?.name}"/>
</div>

