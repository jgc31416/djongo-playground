from djongo import models


# Create your models here.
class Location(models.Model):
    x = models.FloatField()
    y = models.FloatField()


class Zips(models.Model):
    _id = models.ObjectIdField()
    city = models.CharField(max_length=200)
    zip = models.CharField(max_length=20)
    pop = models.IntegerField()

    location = models.ArrayReferenceField(
        to=Location,
        on_delete=models.CASCADE,
    )

    state = models.CharField(max_length=5)

    objects = models.DjongoManager()

    def __str__(self):
        return str(self.city)
