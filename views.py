from django.shortcuts import render


def base(request):
    return render(request, 'base.html')


def portfolio(request):
    return render(request, 'menu/portfolio.html')


def about(request):
    return render(request, 'menu/about.html')
