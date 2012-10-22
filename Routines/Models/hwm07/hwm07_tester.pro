
pro hwm07_tester


yyddd = 98091L
sec = 60.*60.*12.0


lat = 65.
lon = -147.

f107a = 100.
f107 = 100.
ap = fltarr(2)
ap(0) = 4.
ap(1) = 4.
alt = 240.


lst = sec/3600. + lon/15.

w = fltarr(2)

zonal93 = fltarr(200)
merid93 = zonal93
zonal = zonal93
merid = zonal93



dir = 'C:\RSI\IDLSource\Code\HWM\Win32HWM07+\'
etmod = dir + 'hwm07+.dll'
cd, dir

for i = 0, 199 do begin

	sec = 24*3600.*i/200.
    result = call_external(etmod,'hwm93', $
        yyddd,sec,alt,lat,lon,lst,f107a,f107,ap,w)
 	merid93(i) = w(0)
	zonal93(i) = w(1)
    result = call_external(etmod,'hwm07', $
       yyddd,sec,alt,60.,-145.,0.,0.,0.,ap,w)
    merid(i) = w(0)
    zonal(i) = w(1)
endfor

stop

end