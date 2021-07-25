"""
This example showcases:
- using a points to generate masks
"""

from pre_processing import mask
import numpy as np
import scipy.io
from pyevtk.hl import gridToVTK
point=np.loadtxt("output.xyz")

n=5
nxd=15*n
nyd=18*n
nzd=100*n
nxp=nxd+1       
nyp=nyd+1
nzp=nzd+1

xp=np.linspace(0,150,nxp)
yp=np.linspace(0,180,nyp)
zp=np.linspace(0,1000,nzp)
mask1=mask.mask_interpolation_non_uniform (point,xp,yp,zp)
gridToVTK("mask1",xp,yp,zp,cellData = {"mask1":mask1})
np.save('result',mask1)
