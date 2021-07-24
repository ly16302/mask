#!/usr/bin/env python3
import setuptools
import site
import sys 
from numpy.distutils.core import setup, Extension

site.ENABLE_USER_SITE = True

setup(
   name="mask",
   version="0.0.1",
   author="Liang Yang",
   author_email="liang.yang@cranfield.ac.uk",
   description="Example package to demonstrate wheel issue",

   ext_modules=[Extension('mask_interpolation', sources=['src/mask_interpolation.f90'])],
)
