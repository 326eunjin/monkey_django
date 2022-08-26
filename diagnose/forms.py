from django import forms


class ImagefieldForm(forms.Form):
    name = forms.CharField()
    image_field = forms.ImageField()
