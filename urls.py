from django.urls import path
import views


urlpatterns = [
    path('', views.base, name='base'),
    path('portfolio', views.portfolio, name='portfolio'),
    path('about', views.about, name='about'),
]
