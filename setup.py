from subprocess import *
from setuptools import setup, find_packages
from setuptools.command.install import install
import os

setup(
    name = 'kube-provision',
    version = '0.1',
    scripts = ['kube-provision'],
    install_requires = ['ansible-deploy', 'ansible-provision', 'ansible-kubectl'],
    url = 'https://www/github.com/moshloop/kube-provision',
    author = 'Moshe Immerman', author_email = 'moshe.immerman@gmail.com'
)