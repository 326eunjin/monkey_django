{% if images %}
	{% for image in images %}
		<img src="{{ MEDIA_URL }}images/{{ image }}" alt="{{ image }}">
	{% endfor %}
{% else %}
	<p>No image available.</p>
{% endif %}