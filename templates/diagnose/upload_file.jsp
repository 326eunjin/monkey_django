<html>
    <head>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data">
            {% csrf_token %}
            <input type="file" name="uploaded_file">
            <button type="submit">Upload</button>
          </form>

          {% if filename %}
            <p>File uploaded: <a href="{{ filename }}">{{ filename }}</a></p>
          {% endif %}
    </body>
</html> 