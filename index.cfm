<!DOCTYPE html>
<html lang="en">
<head>
    <title>Airtable GraphQL ColdFusion Demo</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
    
</head>
<body>
<table id="graphqltable" name="graphqltable" class="dataTable" style="width: 100%">
    <thead>
        <tr>
            <th>Id</th>
            <th>Item</th>
            <th>Notes</th>
            <th>Done?</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#graphqltable').DataTable( {
        ajax: {
            url: 'getData.cfm',
            dataSrc: 'table1'
        },
        columns: [
            {data: 'id'},
            {data: 'item'},
            {data: 'notes'},
            {data: 'done'}
        ]
    } );
} );
</script>
</html>