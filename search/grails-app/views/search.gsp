<g:autoComplete id="countrySearch"
                action='autocompleteCountry'
                controller='any'
                domain='rentspace.Country'
                searchField='name'
                collectField='id'
                value=''
/>

<g:textField id="hiddenState"  name="hiddenState" value=""/>

<label>City:</label>
<g:autoComplete name="citySearch" id="citySearch"
                cid=""
                action='autocompleteCityAction'
                controller='any'
                domain='rentspace.City'
                searchField='name'
                value=''
/>