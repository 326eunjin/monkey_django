<html>
<head>
<title>Django File Upload</title>
</head>
<body>
<form method="POST" enctype="multipart/form-data"> 
    {% csrf_token %} 
    {{ form.as_p }} 
    <input type="submit" value="Submit" id="submitbutton"> 
</form> 

</body>
</html>