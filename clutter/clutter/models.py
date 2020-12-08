# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Book(models.Model):
    book_author = models.CharField(db_column='BOOK_AUTHOR', max_length=45, blank=True, null=True)  # Field name made lowercase.
    book_bookmark = models.IntegerField(db_column='BOOK_BOOKMARK', blank=True, null=True)  # Field name made lowercase.
    book_completion = models.IntegerField(db_column='BOOK_COMPLETION', blank=True, null=True)  # Field name made lowercase.
    media_idmedia = models.OneToOneField('Media', models.DO_NOTHING, db_column='MEDIA_idMEDIA', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'book'


class Contacts(models.Model):
    idcontacts = models.IntegerField(db_column='idCONTACTS', primary_key=True)  # Field name made lowercase.
    user_iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='USER_idUSER')  # Field name made lowercase.
    contact_first_name = models.CharField(db_column='CONTACT_FIRST_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    contact_middle_name = models.CharField(db_column='CONTACT_MIDDLE_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    contact_last_name = models.CharField(db_column='CONTACT_LAST_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    contact_phone_num = models.IntegerField(db_column='CONTACT_PHONE_NUM', blank=True, null=True)  # Field name made lowercase.
    contact_note = models.CharField(db_column='CONTACT_NOTE', max_length=255, blank=True, null=True)  # Field name made lowercase.
    contact_location = models.CharField(db_column='CONTACT_LOCATION', max_length=45, blank=True, null=True)  # Field name made lowercase.
    contact_relationship = models.CharField(db_column='CONTACT_RELATIONSHIP', max_length=45, blank=True, null=True)  # Field name made lowercase.
    contact_birthday = models.DateField(db_column='CONTACT_BIRTHDAY', blank=True, null=True)  # Field name made lowercase.
    contact_email = models.CharField(db_column='CONTACT_EMAIL', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'contacts'
        unique_together = (('idcontacts', 'user_iduser'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Event(models.Model):
    idevent = models.IntegerField(db_column='idEVENT', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='idUSER')  # Field name made lowercase.
    event_name = models.CharField(db_column='EVENT_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    event_location = models.CharField(db_column='EVENT_LOCATION', max_length=45, blank=True, null=True)  # Field name made lowercase.
    event_date = models.DateField(db_column='EVENT_DATE')  # Field name made lowercase.
    event_time = models.TimeField(db_column='EVENT_TIME', blank=True, null=True)  # Field name made lowercase.
    event_description = models.CharField(db_column='EVENT_DESCRIPTION', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'event'
        unique_together = (('idevent', 'iduser'),)


class Financial(models.Model):
    idfinancial = models.DateTimeField(db_column='idFINANCIAL', primary_key=True)  # Field name made lowercase.
    fin_savings = models.FloatField(db_column='FIN_SAVINGS')  # Field name made lowercase.
    fin_expenses = models.FloatField(db_column='FIN_EXPENSES')  # Field name made lowercase.
    fin_earned_income = models.FloatField(db_column='FIN_EARNED_INCOME')  # Field name made lowercase.
    user_iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='USER_idUSER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'financial'
        unique_together = (('idfinancial', 'user_iduser'),)


class GroupEvents(models.Model):
    groups_idgroup_name = models.OneToOneField('Groups', models.DO_NOTHING, db_column='GROUPS_idGROUP_NAME', primary_key=True)  # Field name made lowercase.
    idgroup_events = models.CharField(db_column='idGROUP_EVENTS', max_length=8, blank=True, null=True)  # Field name made lowercase.
    gs_event_name = models.CharField(db_column='GS_EVENT_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    gs_date = models.DateField(db_column='GS_DATE', blank=True, null=True)  # Field name made lowercase.
    gs_time = models.TimeField(db_column='GS_TIME', blank=True, null=True)  # Field name made lowercase.
    gs_description = models.CharField(db_column='GS_DESCRIPTION', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'group_events'


class GroupNotes(models.Model):
    groups_idgroup_name = models.OneToOneField('Groups', models.DO_NOTHING, db_column='GROUPS_idGROUP_NAME', primary_key=True)  # Field name made lowercase.
    idgroup_notes = models.CharField(db_column='idGROUP_NOTES', max_length=8, blank=True, null=True)  # Field name made lowercase.
    gn_description = models.CharField(db_column='GN_DESCRIPTION', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'group_notes'


class GroupTasks(models.Model):
    groups_idgroup_name = models.OneToOneField('Groups', models.DO_NOTHING, db_column='GROUPS_idGROUP_NAME', primary_key=True)  # Field name made lowercase.
    idgroup_tasks = models.CharField(db_column='idGROUP_TASKS', max_length=45, blank=True, null=True)  # Field name made lowercase.
    gt_description = models.CharField(db_column='GT_DESCRIPTION', max_length=100, blank=True, null=True)  # Field name made lowercase.
    gt_completion = models.IntegerField(db_column='GT_COMPLETION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'group_tasks'


class Groups(models.Model):
    idgroup_name = models.CharField(db_column='idGROUP_NAME', primary_key=True, max_length=45)  # Field name made lowercase.
    group_user_fullname = models.CharField(db_column='GROUP_USER_FULLNAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    group_leader = models.IntegerField(db_column='GROUP_LEADER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'groups'


class InspoQuote(models.Model):
    idinspo_quote = models.IntegerField(db_column='idINSPO_QUOTE', primary_key=True)  # Field name made lowercase.
    inspo_description = models.CharField(db_column='INSPO_DESCRIPTION', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'inspo_quote'


class Media(models.Model):
    idmedia = models.IntegerField(db_column='idMEDIA', primary_key=True)  # Field name made lowercase.
    media_name = models.CharField(db_column='MEDIA_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    media_date_added = models.DateField(db_column='MEDIA_DATE_ADDED', blank=True, null=True)  # Field name made lowercase.
    media_type = models.CharField(db_column='MEDIA_TYPE', max_length=5, blank=True, null=True)  # Field name made lowercase.
    user_iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='USER_idUSER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'media'
        unique_together = (('idmedia', 'user_iduser'),)


class Membership(models.Model):
    groups_idgroup_name = models.OneToOneField(Groups, models.DO_NOTHING, db_column='GROUPS_idGROUP_NAME', primary_key=True)  # Field name made lowercase.
    user_iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='USER_idUSER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'membership'
        unique_together = (('groups_idgroup_name', 'user_iduser'),)


class Memo(models.Model):
    idmemo = models.IntegerField(db_column='idMEMO', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='idUSER')  # Field name made lowercase.
    memo_content = models.CharField(db_column='MEMO_CONTENT', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'memo'
        unique_together = (('idmemo', 'iduser'),)


class Movie(models.Model):
    movie_length = models.TimeField(db_column='MOVIE_LENGTH', blank=True, null=True)  # Field name made lowercase.
    movie_director = models.CharField(db_column='MOVIE_DIRECTOR', max_length=45, blank=True, null=True)  # Field name made lowercase.
    movie_rating = models.CharField(db_column='MOVIE_RATING', max_length=45, blank=True, null=True)  # Field name made lowercase.
    movie_completed = models.IntegerField(db_column='MOVIE_COMPLETED', blank=True, null=True)  # Field name made lowercase.
    media_idmedia = models.OneToOneField(Media, models.DO_NOTHING, db_column='MEDIA_idMEDIA', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'movie'


class Music(models.Model):
    music_genre = models.CharField(db_column='MUSIC_GENRE', max_length=45, blank=True, null=True)  # Field name made lowercase.
    music_artist = models.CharField(db_column='MUSIC_ARTIST', max_length=45, blank=True, null=True)  # Field name made lowercase.
    music_album = models.CharField(db_column='MUSIC_ALBUM', max_length=45, blank=True, null=True)  # Field name made lowercase.
    media_idmedia = models.OneToOneField(Media, models.DO_NOTHING, db_column='MEDIA_idMEDIA', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'music'


class Shows(models.Model):
    epwatched = models.IntegerField(db_column='EPWATCHED', blank=True, null=True)  # Field name made lowercase.
    show_eptotal = models.IntegerField(db_column='SHOW_EPTOTAL', blank=True, null=True)  # Field name made lowercase.
    showscol = models.CharField(db_column='SHOWScol', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'shows'


class Tasks(models.Model):
    idtasks = models.IntegerField(db_column='idTASKS', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='idUSER')  # Field name made lowercase.
    task_descriptoin = models.CharField(db_column='TASK_DESCRIPTOIN', max_length=100, blank=True, null=True)  # Field name made lowercase.
    task_check_deletion = models.IntegerField(db_column='TASK_CHECK_DELETION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tasks'
        unique_together = (('idtasks', 'iduser'),)


class User(models.Model):
    iduser = models.CharField(db_column='idUSER', primary_key=True, max_length=45)  # Field name made lowercase.
    user_fullname = models.CharField(db_column='USER_FULLNAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    user_phone_number = models.IntegerField(db_column='USER_PHONE_NUMBER', blank=True, null=True)  # Field name made lowercase.
    user_email = models.CharField(db_column='USER_EMAIL', max_length=45)  # Field name made lowercase.
    user_password = models.CharField(db_column='USER_PASSWORD', max_length=45)  # Field name made lowercase.
    user_location = models.CharField(db_column='USER_LOCATION', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'user'


class View(models.Model):
    idinspo_quote = models.OneToOneField(InspoQuote, models.DO_NOTHING, db_column='idINSPO_QUOTE', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey(User, models.DO_NOTHING, db_column='idUSER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'view'
        unique_together = (('idinspo_quote', 'iduser'),)