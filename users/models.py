from django.db import models


class User(models.Model):
    mail = models.CharField(max_length=100)
    # Field name made lowercase.
    userpw = models.CharField(db_column='userPW', max_length=45)
    gender = models.IntegerField()
    nationality = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'user'


class Usermedicalinfo(models.Model):
    # Field name made lowercase.
    userid = models.OneToOneField(
        User, models.DO_NOTHING, db_column='userID', primary_key=True)
    rash = models.IntegerField()
    fever = models.IntegerField()
    headache = models.IntegerField()
    backpain = models.IntegerField()
    musclepain = models.IntegerField()
    lymphedema = models.IntegerField()
    lethargy = models.IntegerField()
    diagnosed = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'userMedicalInfo'
