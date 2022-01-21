<cfif isDefined("FORM.write")>
    <cfif FORM.write>
        <cfparam name="done" default=false />
        <cfparam name="item" default="" />
        <cfparam name="notes" default="" />
        <cfif FORM.done>
            <cfset done = true />
        </cfif>
        <cfif FORM.item NEQ "">
            <cfset item = FORM.item />
        </cfif>
        <cfif FORM.notes NEQ "">
            <cfset notes = FORM.notes />
        </cfif>

        <cfset graphqlqueryvalue = '{"query": "mutation {insert_table1(done: #done#, item: \"#item#\", notes: \"#notes#\") {id}}"}' />
        <cfhttp  url="https://api.baseql.com/airtable/graphql/YOURENDPOINTGOESHERE" method="post" result="graphql">
        <cfhttpparam  type="header" name="Authorization" value="#request.airtableapikey#">
        <cfhttpparam  type="header" name="Content-Type" value="application/json">
        <cfhttpparam  type="header" name="Accept" value="application/json">

        <cfhttpparam  type="body" value="#graphqlqueryvalue#">
    </cfhttp>
    <cflocation url="/CFSummit2021/" addToken="no" />
    <cfelse>
    GREAT FAIL
    </cfif>
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Airtable</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css" rel="stylesheet" />
<style>
body{
   padding: 30px; 
} 
</style>
</head>
<body>
<form name="aform" method="post" action="addtodo.cfm">
<input type="hidden" name="write" value="1" />
<label for="item">Item</label>
<input type="text" name="item" value="" class="form-control" />
<label for="notes">Notes</label>
<input type="text" name="notes" multiline="true" class="form-control" value="" style="height: 200px;" />
<label for="done">Done</label>
<select name="done" class="form-control">
    <option value=false>No</option>
    <option value=true>Yes</option>
</select>

<button type="submit" name="submit" class="btn btn-success">Create New To Do</button>
</form>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
</body>
</html>