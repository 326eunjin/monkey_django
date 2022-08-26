from django.db import models


# class User(models.Model):
#     mail = models.CharField(max_length=100)
#     # Field name made lowercase.
#     userpw = models.CharField(db_column='userPW', max_length=128)
#     gender = models.IntegerField()
#     nationality = models.CharField(max_length=45)
#     # Field name made lowercase.
#     createdat = models.DateTimeField(
#         db_column='createdAt', blank=True, null=True)
#     # Field name made lowercase.
#     updatedat = models.DateTimeField(
#         db_column='updatedAt', blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'user'


# class Usermedicalinfo(models.Model):
#     # Field name made lowercase.
#     userid = models.ForeignKey(User, on_delete=models.CASCADE)
#     rash = models.IntegerField()
#     fever = models.IntegerField()
#     headache = models.IntegerField()
#     backpain = models.IntegerField()
#     musclepain = models.IntegerField()
#     lymphedema = models.IntegerField()
#     lethargy = models.IntegerField()
#     diagnosed = models.IntegerField()
#     # Field name made lowercase.
#     createdat = models.DateTimeField(db_column='createdAt')
#     # Field name made lowercase.
#     updatedat = models.DateTimeField(db_column='updatedAt')
#     image = models.CharField(max_length=200, blank=True, null=True)
#     title = models.CharField(max_length=200, blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'userMedicalInfo'


class User(models.Model):
    mail = models.CharField(max_length=100)
    # Field name made lowercase.
    userpw = models.CharField(db_column='userPW', max_length=128)
    gender = models.IntegerField()
    nationality = models.CharField(max_length=45)
    # Field name made lowercase.
    createdat = models.DateTimeField(
        db_column='createdAt', blank=True, null=True)
    # Field name made lowercase.
    updatedat = models.DateTimeField(
        db_column='updatedAt', blank=True, null=True)
    rash = models.IntegerField(blank=True, null=True)
    fever = models.IntegerField(blank=True, null=True)
    headache = models.IntegerField(blank=True, null=True)
    backpain = models.IntegerField(blank=True, null=True)
    musclepain = models.IntegerField(blank=True, null=True)
    lymphedema = models.IntegerField(blank=True, null=True)
    lethargy = models.IntegerField(blank=True, null=True)
    diagnosed = models.IntegerField(blank=True, null=True)
    image = models.ImageField(upload_to="images/")

    class Meta:
        managed = False
        db_table = 'user'
