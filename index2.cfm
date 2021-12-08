  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Airtable</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css" rel="stylesheet" />
</head>
<body>
<cfscript>
    cfhttp(url="https://api.airtable.com/v0/appf0nN2C1ZovOXDH/TblPets?api_key=YOURAPIKEYGOESHERE", result="airtable");
    airtablereturn = deserializeJSON(airtable.fileContent) ;
    writeOutput("<table class='table' id='airtable'><thead><tr><th>ID</th><th>NAME</th>></tr></thead><tbody>");
    for (i=1; i <= arrayLen(airtablereturn.records); i=i+1){
        writeOutput("<tr>");
        writeOutput("<td>" & airtablereturn.records[i].fields.ID & "</td>");
        writeOutput("<td>" & airtablereturn.records[i].fields.name & "</td>");
        writeOutput("</tr>");
    }
    writeOutput("</tbody></table>");
</cfscript>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready( function () {
    $('#airtable').DataTable();
} );
</script>
</body>
</html>