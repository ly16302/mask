subroutine mask_interpolation_non_uniform (points,Npts,nxp,nyp,nzp,xp,yp,zp,&
                           mask)
	 implicit none 
	 	
	 !input
	 integer, intent(in) :: Npts,nxp,nyp, nzp
	 
	 real(8), dimension(nxp), intent(in) :: xp
	 real(8), dimension(nyp), intent(in) :: yp
	 real(8), dimension(nzp), intent(in) :: zp
	
	 real(8), dimension(Npts,3), intent(in) :: points
	  real(8), dimension(nxp-1, nyp-1, nzp-1), intent(out) :: mask
	 
     !constant
	 real(8) :: dx, dy, dz, x, y, z
	 integer :: indexx1, indexy1, indexz1
	 integer :: ip
	 
	
     !$OMP PARALLEL DO DEFAULT(SHARED) &
     !$OMP PRIVATE(ip,indexx1, indexy1, indexz1,x, y, z) 
	 
	 Do ip=1, Npts
	 	x=points(ip,1)
	    y=points(ip,2)
		z=points(ip,3)
		

		indexx1=MINLOC(ABS(xp-x),  DIM=1)
		IF (xp(indexx1) < x) THEN
			indexx1=indexx1
		ELSE 
		    indexx1=indexx1-1
		END IF
		
		IF (indexx1 <1) THEN
			indexx1=1
		END IF
		
		IF (indexx1 >=nxp) THEN
			indexx1=nxp-1
		END IF
		
		
		indexy1=MINLOC(ABS(yp-y), DIM=1)
		IF (yp(indexy1) < y) THEN
			indexy1=indexy1
		ELSE 
		    indexy1=indexy1-1
		END IF
       
		
		IF (indexy1 <1) THEN
			indexy1=1
		END IF
		
		IF (indexy1 >=nyp) THEN
			indexy1=nyp-1
		END IF
		
		
		indexz1=MINLOC(ABS(zp-z), DIM=1)
		IF (zp(indexz1) < z) THEN
			indexz1=indexz1
		ELSE 
		    indexz1=indexz1-1
		END IF
       
		
		IF (indexz1 <1) THEN
			indexz1=1
		END IF
		
		IF (indexz1 >=nzp) THEN
			indexz1=nzp-1
		END IF

   mask(indexx1, indexy1, indexz1) = 1
   
	END DO
	
	!$OMP END PARALLEL DO
	
end subroutine mask_interpolation_non_uniform
