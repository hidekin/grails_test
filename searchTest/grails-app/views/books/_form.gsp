<%@ page import="searchtest.Books" %>



<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="books.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${searchtest.Author.list()}" optionKey="id" required="" value="${booksInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="books.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${booksInstance?.name}"/>
</div>

