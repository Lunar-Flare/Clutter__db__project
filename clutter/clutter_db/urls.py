from django.urls import path, include
from . import views
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView #login,logout #Classbase call

from django.contrib import admin

# Once you have added this, navigate to your project dependency folder and 
# add the path to this file in the urls.py of your project

urlpatterns = [
    #Test path
    path ('', views.index, name='index'), # localhost:8000 or localhost:8000/login
    
    #paths for clutter
    path("login/", LoginView.as_view(template_name='Login.html'), name="Login"),    
    
    path("logout/",LoginView.as_view(template_name='Logout.html'), name="Logout"),
    path("logout.html",LoginView.as_view(template_name='logout.html'), name="logout.html"),
    path('homepage/logout.html',LoginView.as_view(template_name='Login.html'),name="Login"),
    
    path('register/',views.register,name='register'),
    path('accounts/login/',LoginView.as_view(template_name='Login.html'), name="Login"),
    
    #Paths for homepage
    #Encompasses event, memos, and tasks
    path('homepage/home.html',views.homepage, name='homepage'), 
    
    path('homepage/task_add.html',views.task_add,name='task_add'),
    path('homepage/task_delete.html',views.task_delete,name='task_delete'),
    
    path('homepage/event_add.html',views.event_add,name='event_add'),
    path('homepage/event_delete.html',views.event_delete,name='event_delete'),
    path('homepage/event_update.html',views.event_update,name='event_update'),
    
    path('homepage/memo_add.html',views.memo_add,name='memo_add'),
    path('homepage/memo_delete.html',views.memo_delete,name='memo_delete'),
    path('homepage/memo_update.html',views.memo_update,name='memo_update'),
    
    #currently group management is unimplemented
    path('homepage/groupmanagement.html',views.group_management, name='group_management'), #Encompasses group tasks, group notes, and group events
    
    #Encompasses contacts
    path('homepage/contacts.html',views.contacts, name='contacts'),
    path('homepage/contacts_add.html',views.contacts_add,name='contacts_add'),
    path('homepage/contacts_delete.html',views.contacts_delete,name='contacts_delete'),
    path('homepage/contacts_update.html',views.contacts_update,name='contacts_update'),   
     
    #Encompasses finances
    path('homepage/finances.html',views.finance, name='finance'),
    path('homepage/finances_add.html',views.finances_add,name='finances_add'),
    path('homepage/finances_delete.html',views.finances_delete,name='finances_delete'),
    path('homepage/finances_update.html',views.finances_update,name='finances_update'),
    
    #media table
    path('homepage/books.html',views.book, name='book'), 
    path('homepage/book_add.html',views.book_add,name='book_add'),
    path('homepage/book_delete.html',views.book_delete,name='book_delete'),
    path('homepage/book_update.html',views.book_update,name='book_update'),
    
    path('homepage/movies.html',views.movies, name='movie'), 
    path('homepage/movies_add.html',views.movies_add,name='movies_add'),
    path('homepage/movies_delete.html',views.movies_delete,name='movies_delete'),
    path('homepage/movies_update.html',views.movies_update,name='movies_update'),
    
    path('homepage/music.html',views.music, name='music'),
    path('homepage/music_add.html',views.music_add,name='music_add'),
    path('homepage/music_delete.html',views.music_delete,name='music_delete'),
    path('homepage/music_update.html',views.music_update,name='music_update'),
    
    path('homepage/shows.html',views.shows, name='shows'),    
    path('homepage/shows_add.html',views.shows_add,name='shows_add'),
    path('homepage/shows_delete.html',views.shows_delete,name='shows_delete'),
    path('homepage/shows_update.html',views.shows_update,name='shows_update'),
    
    #Examples
    # path('$/', views.posts, name = 'posts'), #This will allow acces to the views for these URL operations
    # path('$/', views.comments, name='comments'),
]