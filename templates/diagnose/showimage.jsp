{% load static %}
<!DOCTYPE html>
<html>
<body>
    <h1>Name - {{emp.name}}</h1>
    <img src="{{emp.image.url}}" alt="Smiley face" width="250" height="250">
    <br />
    <a href="{% url 'home' %}">Go Back!!!</a>
</body>
</html>