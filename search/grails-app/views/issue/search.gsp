<%@ page import="org.springframework.util.ClassUtils" %>



<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />

    <style type="text/css">
    .title {
        margin: 1em 0;
        padding: .3em .5em;
        text-align: right;
        background-color: seashell;
        border-top: 1px solid lightblue;
    }

    </style>
</head>
<body onload="focusQueryInput();">

<div class="body">
    <div id="header">
        <h1>Issue search Results</h1>
    </div>
    <div style="clear: both; display: none;" class="hint">See <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for advanced queries</div>

    <div class="nav">
        <g:form url='[controller: "issue", action: "search"]' id="searchableForm" name="searchableForm" method="get">
            <g:textField name="q" value="${params.q}" /> <input type="submit" value="Search" />
        </g:form>
    </div>



    <g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />



    <g:if test="${haveResults}">
        <div class="list">
            <table>
                <thead>
                <tr>

                 <td><strong>title</strong></td>
                </tr>
                </thead>
                <tbody>
                <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
                <g:each in="${searchResult.results}" status="i" var="iss">
                    <tr>
                        <td>${iss.title}</td>

                        %{--<td>${emp.firstName?.encodeAsHTML()}</td>--}%

                        <td class="actionButtons">
                            <span class="actionButton">
                                <g:link action="show" id="${iss.id}">Details</g:link>
                            </span>
                        </td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate params="[q: params.q]" total="${searchResult.total}"/>

        </div>

    </g:if>

    <br/>
    <div class="title">
        <span>
            <g:if test="${haveQuery && haveResults}">
                Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
                results for <strong>${params.q}</strong>
            </g:if>
            <g:else>
                &nbsp;
            </g:else>
        </span>
    </div>
    <br/>

    <g:if test="${haveQuery && !haveResults && !parseException}">
        <p>Nothing matched your query - <strong>${params.q}</strong></p>
    </g:if>
    <g:if test="${searchResult?.suggestedQuery}">
        <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
    </g:if>

    <g:if test="${parseException}">
        <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
        <p>Suggestions:</p>
        <ul>
            <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
            <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
                <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
                    <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
                </li>
                <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
                    <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
                    <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
                </li>
            </g:if>
        </ul>
    </g:if>


</div>
</body>
</html>
