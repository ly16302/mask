#!/usr/bin/env python
import setuptools
import site
import sys 
from numpy.distutils.core import setup, Extension

site.ENABLE_USER_SITE = True

setup(
   name="mask-generation",
   version="0.0.1",
   ext_modules=[Extension('pre_processing', sources=['src/mask_interpolation.f90'])],
)
