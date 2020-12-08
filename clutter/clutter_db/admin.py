from django.contrib import admin

#Import all models you want from database

from clutter_db.models import *

# Register your models here.
admin.site.register(Book)
admin.site.register(Contacts)
admin.site.register(Event)
admin.site.register(Financial)
admin.site.register(Groups)
admin.site.register(GroupEvents)
admin.site.register(GroupNotes)
admin.site.register(GroupTasks)
admin.site.register(InspoQuote)
admin.site.register(Membership)
admin.site.register(Media)
admin.site.register(Memo)
admin.site.register(Movie)
admin.site.register(Music)
admin.site.register(Shows)
admin.site.register(Tasks)
admin.site.register(User)
admin.site.register(View)
