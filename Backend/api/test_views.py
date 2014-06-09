import json

from django.test import TestCase
from django.core.urlresolvers import reverse

from .models import Playlist, Song, User


class TestUser(TestCase):
    """
    Test to ensure that user creation works before testing things that require a user
    """

    def setUp(self):
        self.user = User.objects.create_user(
            username='testingUser', email='testuser@test.com', password='top_secret')

    def test_user_present(self):
        self.assertEqual(self.user.username, "testingUser")


class DjangoRestFrameworkTests(TestCase):
    """
    Tests for the DjangoRestFramework backend / api endpoints
    """
    def setUp(self):
        self.user = User.objects.create_user(
            username='testingUser', email='testuser@test.com', password='top_secret')
        Playlist.objects.get_or_create(title="Playlist1", description="DS1", user=self.user)
        Playlist.objects.get_or_create(title="Playlist2", description="DS2", user=self.user)


    def test_list(self):
        playlist1 = Playlist.objects.get(title="Playlist1")
        self.assertEqual(playlist1.title, "Playlist1")