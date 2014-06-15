from django.contrib import admin
from .models import Song, Playlist
# Register your models here.

class SongInline(admin.TabularInline):
    model = Song
    extra = 3

class PlaylistAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,      {'fields': ['title']}),
    ]
    #inlines = (SongInline,)
    list_display = ('title', 'created', 'modified', 'user', 'description')
    list_filter = ('modified',)
    search_fields = ['title']

admin.site.register(Playlist, PlaylistAdmin)