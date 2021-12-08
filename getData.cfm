 <!---<cfset graphqlqueryvalue = '{"query": "{table1 { id item notes done }}"}' />--->
<cfset graphqlqueryvalue = '{"query": "{table1 (item:\"Dog walk\") { id item notes done }}"}' /> 
<cfhttp  url="https://api.baseql.com/airtable/graphql/YOURENDPOINTGOESHERE" method="post" result="graphql">
    <cfhttpparam  type="header" name="Authorization" value="#request.airtableapikey#">
    <cfhttpparam  type="header" name="Content-Type" value="application/json">
    <cfhttpparam  type="header" name="Accept" value="application/json">
    <cfhttpparam  type="body" value="#graphqlqueryvalue#">
</cfhttp>
<cfset apiOutput = deserializeJSON(graphql.filecontent) />
<cfset apiOutput = serializeJSON(apiOutput.data) />
<cfoutput>#apiOutput#</cfoutput>