from setuptools import setup, find_packages, Extension
import sys 

setup(
   name="example",
   version="0.0.1",
   author="Liang Yang",
   author_email="liang.yang@cranfield.ac.uk",
   description="Example package to demonstrate wheel issue",
   packages=['mask', 'mask.extension_package'],
   ext_modules=[Extension('mask', sources=['src/mask_interpolation.f90'])],
)
