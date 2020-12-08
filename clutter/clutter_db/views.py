from django.shortcuts import render, redirect#will render/show web files
from django.http import HttpResponse
from django.shortcuts import get_object_or_404,redirect  
from .models import *

import random 
import re

from datetime import datetime 
from django.conf import settings
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm

# Create your views here.
# Basic homepage 
def index (request):
    return redirect('login/')
    #return HttpResponse("Hello, welcome to the index page.This is a test.")#In templates folder
    # reder takes 2 args: request which is a webapp thing
    # and the path of the template containing your html file 
    # when you specify any html file django will look for a templates folder 
    # so create a folder called templates in your project folder.
    # within templates folder you will also create classicmodels sub-folder 
    # since in the path we have written classicmodels/login.html
    # and then create login.html in that folder 

#not implemented?
# Create your views here.
def register(response):
    if response.method == "POST":
        form = UserCreationForm(response.POST)
        if form.is_valid():
            form.save()
            return redirect('/login/')
    else:
        form = UserCreationForm()
    return render(response, "register.html",{'form':form})

def logout(request):
    logout(request)
    return redirect('login/')
    
def inspoQuotes():
    if InspoQuote.objects.exists():
        all_inspo = InspoQuote.objects.all()
        j = len(all_inspo)-1
        i = random.randint(0,j)
        single_inspo = all_inspo[i]
        return single_inspo
    else:
        return "Believe in the me that believes in you"

def homepage(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    tasks = Tasks.objects.all()
    events=Event.objects.all()
    memos=Memo.objects.all()
    
    return render(request, 'home.html',{'inspo':single_inspo, 'tasks':tasks,
                  'events':events, 'memos':memos}) 
    
def memo_add(request):
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    temp = Memo.objects.all()
    memoID = len(temp)
    i = 0
    while i == 0:
        if Memo.objects.filter(idmemo = memoID).exists():
            memoID += 1
            i=0
        else:
            i=1    
            
    #saving contact object 
    Memo.objects.create(idmemo = memoID, iduser = userID)

    #redirect to home page with new memo
    return redirect('home.html')

def memo_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Memo.objects.filter(idmemo = pk[0]).delete()
    
    return redirect('home.html')

def memo_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    note = request.GET['note']
    
    #updating model object values
    Memo.objects.filter(idmemo = pk[0]).update(memo_content=note)
    
    return redirect('home.html')
    
def event_add(request):
    #obtaining all values from user
    date = request.GET['date']
    time = request.GET['time']
    event = request.GET['event']
    location = request.GET['location']
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    temp = Event.objects.all()
    eventID = len(temp)
    i = 0
    while i == 0:
        if Event.objects.filter(idevent = eventID).exists():
            eventID += 1
            i=0
        else:
            i=1    
        
    #saving contact object 
    Event.objects.create(event_date= date,event_time=time,
                         event_description=event,event_location=location,
                         idevent = eventID, iduser = userID)

    #redirect to home page with new event
    return redirect('home.html')
    
def event_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Event.objects.filter(idevent = pk[0]).delete()
    
    return redirect('home.html')

def event_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    date=request.GET['date']
    time=request.GET['time']
    event=request.GET['event']
    location=request.GET['location']
    #updating model object values
    Event.objects.filter(idevent=pk[0]).update(event_description=event)
    Event.objects.filter(idevent=pk[0]).update(event_date=date)
    Event.objects.filter(idevent=pk[0]).update(event_time=time)
    Event.objects.filter(idevent=pk[0]).update(event_location=location)
    
    return redirect('home.html')    

def task_add(request):
    #obtaining all values from user
    task=request.GET['task']

    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting contact id
    temp = Tasks.objects.all()
    taskID = len(temp)+1
    
    #saving contact object 
    Tasks.objects.create(task_descriptoin = task,
                         idtasks = taskID, iduser = userID)

    #redirect to contact page with new contact
    return redirect('home.html')
    
def task_delete(request):    
    #primary key
    pk = (request.GET['checkbox']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Tasks.objects.filter(idtasks = pk[0]).delete()
    
    return redirect('home.html')
    
def contacts(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    #Contacts table
    all_contacts = Contacts.objects.all()
    return render(request, 'contacts.html',{'inspo':single_inspo, 'contacts':all_contacts}) 

def contacts_add(request):
    #obtaining all values from user
    first=request.GET['name']
    middle=request.GET['middle']
    last=request.GET['last']
    phone=request.GET['phone']
    email=request.GET['email']
    relation=request.GET['relationship']
    bday=request.GET['birthday']
    location=request.GET['location']
    note = request.GET['note'] 
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting contact id
    contact = Contacts.objects.all()
    conID = len(contact)+1
    
    #saving contact object 
    e = Contacts.objects.create(idcontacts=conID,user_iduser=userID,contact_first_name=first,
                                contact_middle_name=middle,contact_last_name=last,
                                contact_phone_num=phone,contact_email=email,
                                contact_relationship=relation,contact_birthday=bday,
                                contact_location =location, contact_note=note,)
    e.save()
    
    #redirect to contact page with new contact
    return redirect('contacts.html')

def contacts_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Contacts.objects.filter(idcontacts = pk[0]).delete()
    
    return redirect('contacts.html')

def contacts_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    first=request.GET['name']
    middle=request.GET['middle']
    last=request.GET['last']
    phone=request.GET['phone']
    email=request.GET['email']
    relation=request.GET['relation']
    bday=request.GET['birthday']
    location=request.GET['location']  
    notes =request.GET['note']  
    
    #updating model object values
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_first_name=first)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_middle_name=middle)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_last_name=last)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_phone_num=phone)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_email=email)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_relationship=relation)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_birthday=bday)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_location=location)
    Contacts.objects.filter(idcontacts=pk[0]).update(contact_note=notes)

    return redirect('contacts.html')    
    
def finance(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    #Finance table
    all_finance = Financial.objects.all()
    return render(request, 'finances.html',{'inspo':single_inspo, 'finance':all_finance})     
    
def finances_add(request):
    #obtaining all values from user
    earn = int(request.GET['earning'])
    expense = int(request.GET['expense'])
    earnedIncome = earn-expense
    date = datetime.now() 
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #saving finances object 
    Financial.objects.create(idfinancial= date,fin_savings=earn,fin_expenses=expense,
                            fin_earned_income=earnedIncome, user_iduser=userID)
    #redirect to finance page with new date
    return redirect('finances.html')

def finances_delete(request):
    #primary key
    date = (request.GET['pk']) 
    
    #finding object that matches primary key and deleting
    Financial.objects.filter(idfinancial=date).delete()
    
    return redirect('finances.html')

def finances_update(request):
    #obtaining all values from user
    earn = int(request.GET['earning'])
    expense = int(request.GET['expense'])
    savings = earn-expense
    date = (request.GET['pk']) 
    
    #updating model object values
    Financial.objects.filter(idfinancial = date).update(fin_savings=earn) 
    Financial.objects.filter(idfinancial = date).update(fin_expenses=expense) 
    Financial.objects.filter(idfinancial = date).update(fin_earned_income=savings) 
    
    return redirect('finances.html')    

#Group management is unimplemented as of now   
def group_management(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    return render(request, 'groupmanagement.html',{'inspo':single_inspo})    
    
def book(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    #book table
    all_books = Book.objects.all() 
    
    return render(request, 'books.html',{'inspo':single_inspo, 'books':all_books}) 

def book_add(request):
    #obtaining all values from user
    name = request.GET['book-name']
    author = request.GET['author']
    bookmark = request.GET['bookmark'] 

    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    media = Media.objects.all()
    mediaID = len(media)
    i = 0
    while i == 0:
        if Media.objects.filter(idmedia = mediaID).exists():
            mediaID += 1
            i=0
        else:
            i=1    
        
    #saving show object to media and user
    d= Media.objects.create(idmedia = mediaID, user_iduser = userID, media_name = name)
    d.save()
    e = Book.objects.create(book_author=author,book_bookmark= bookmark, media_idmedia = d)
    e.save()
    #redirect to book page with new book
    return redirect('books.html')

def book_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Book.objects.filter(media_idmedia = pk[0]).delete()
    Media.objects.filter(idmedia = pk[0]).delete()
    
    return redirect('books.html')

def book_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    name = request.GET['Book-Name']
    author = request.GET['Author']
    bookmark = request.GET['Bookmark']
    #completed = request.GET['Completed']
    completed = 0   
    #updating model object values
    Book.objects.filter(media_idmedia=pk[0]).update(book_author = author)
    Book.objects.filter(media_idmedia=pk[0]).update(book_bookmark = bookmark)
    Book.objects.filter(media_idmedia=pk[0]).update(book_completion = completed)
    Media.objects.filter(idmedia=pk[0]).update(media_name = name)   
    
    return redirect('books.html')

def movies(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    #movies table
    all_movies = Movie.objects.all()
    
    return render(request, 'movies.html',{'inspo':single_inspo, 'movies':all_movies}) 

def movies_add(request):
    #obtaining all values from user
    name = request.GET['moive-name']
    director = request.GET['Director']
    length = request.GET['length']
    rating = request.GET['Rating']
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    media = Media.objects.all()
    mediaID = len(media)
    i = 0
    while i == 0:
        if Media.objects.filter(idmedia = mediaID).exists():
            mediaID += 1
            i=0
        else:
            i=1    
        
    #saving movie object to media and user
    d= Media.objects.create(idmedia = mediaID, user_iduser = userID, media_name = name)
    d.save()
    e = Movie.objects.create(movie_director = director, movie_length=length,
                             movie_rating=rating, media_idmedia = d)
    e.save()
    
    #redirect to movies page with new movie
    return redirect('movies.html')

def movies_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Movie.objects.filter(media_idmedia = pk[0]).delete()
    Media.objects.filter(idmedia = pk[0]).delete()
    
    return redirect('movies.html')

def movies_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    director = request.GET['Director']
    length = request.GET['length']
    rating = request.GET['Rating']
    #completed = request.GET['Completed']
    name = request.GET['movie-name']
        
    #updating model object values
    Movie.objects.filter(media_idmedia=pk[0]).update(movie_length = length)
    Movie.objects.filter(media_idmedia=pk[0]).update(movie_director = director)
    Movie.objects.filter(media_idmedia=pk[0]).update(movie_rating = rating)
    #Movie.objects.filter(media_idmedia=pk[0]).update(movie_completed = completed)
    Media.objects.filter(idmedia=pk[0]).update(media_name = name)   
    
    return redirect('movies.html')
    
def music(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    #Music table
    all_music = Music.objects.all()
    return render(request, 'music.html',{'inspo':single_inspo, 'music':all_music})

def music_add(request):
    #obtaining all values from user
    genre = request.GET['genre']
    album = request.GET['album']
    artist = request.GET['artist']
    name = request.GET['song-name']
    
    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    media = Media.objects.all()
    mediaID = len(media)
    i = 0
    while i == 0:
        if Media.objects.filter(idmedia = mediaID).exists():
            mediaID += 1
            i=0
        else:
            i=1    
        
    #saving music object to media and user
    d= Media.objects.create(idmedia = mediaID, user_iduser = userID, media_name = name)
    d.save()
    e = Music.objects.create(music_genre = genre, music_album=album,music_artist=artist, 
                             media_idmedia = d)
    e.save()
    
    #redirect to music page with new music
    return redirect('music.html')

def  music_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Music.objects.filter(media_idmedia = pk[0]).delete()
    Media.objects.filter(idmedia = pk[0]).delete()
    
    return redirect('music.html')

def music_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    genre = request.GET['genre']
    album = request.GET['album']
    artist = request.GET['artist']
    name = request.GET['song-name']
        
    #updating model object values
    Music.objects.filter(media_idmedia=pk[0]).update(music_genre = genre)
    Music.objects.filter(media_idmedia=pk[0]).update(music_album = album)
    Music.objects.filter(media_idmedia=pk[0]).update(music_artist = artist)
    Media.objects.filter(idmedia=pk[0]).update(media_name = name)   
    
    return redirect('music.html')

def shows(request):
    #Inspirational quotes
    single_inspo = inspoQuotes()
    
    all_shows = Shows.objects.all()
    return render(request, 'shows.html',{'inspo':single_inspo, 'shows':all_shows}) 

def shows_add(request):
    #obtaining all values from user
    epwatched = request.GET['epwatched']
    show_eptotal = request.GET['show_eptotal']
    name = request.GET['show-name'] 

    #getting user id
    use = User.objects.all()
    userID = use[0]
    
    #getting media id
    media = Media.objects.all()
    mediaID = len(media)
    i = 0
    while i == 0:
        if Media.objects.filter(idmedia = mediaID).exists():
            mediaID += 1
            i=0
        else:
            i=1       

    #saving show object to media and user
    d= Media.objects.create(idmedia = mediaID, user_iduser = userID, media_name = name)
    d.save()
    e = Shows.objects.create(epwatched=epwatched,show_eptotal= show_eptotal, media_idmedia = d)
    e.save()
    
    #redirect to show page with new show
    return redirect('shows.html')

def  shows_delete(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #finding object that matches primary key and deleting
    Shows.objects.filter(media_idmedia = pk[0]).delete()
    Media.objects.filter(idmedia = pk[0]).delete()
    
    return redirect('shows.html')

def shows_update(request):
    #primary key
    pk = (request.GET['pk']) 
    pk = re.findall('\d+', pk)
    
    #obtaining all values from user
    showTotal = int(request.GET['total'])
    watched = int(request.GET['epwatched'])
    name = request.GET['show-name']
        
    #updating model object values
    Shows.objects.filter(media_idmedia=pk[0]).update(show_eptotal  = showTotal)
    Shows.objects.filter(media_idmedia=pk[0]).update(epwatched= watched)
    Media.objects.filter(idmedia=pk[0]).update(media_name = name)   
    
    return redirect('shows.html')

