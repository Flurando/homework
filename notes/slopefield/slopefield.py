#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  Copyright Â© 2013 Compdigitec
#  http://www.compdigitec.com/labs/?p=349
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#

# this file seems to be written in python2, which is outdated
# need translation

import math
from subprocess import CalledProcessError, call, check_call

def dy_dx(x, y):
	try:
		# declare your dy/dx here:
		return x/y
	except ZeroDivisionError:
		return 1000.0

# Adjust window parameters
XMIN = -8.0
XMAX = 8.0
YMIN = -8.0
YMAX = 8.0
XSCL = 1 # seems like footstep
YSCL = 1

DISTANCE = 0.4

def main():
	fileobj = open("data.txt", "w")
	for x1 in xrange(int(XMIN / XSCL), int(XMAX / XSCL)):
		for y1 in xrange(int(YMIN / YSCL), int(YMAX / YSCL)):
			x= float(x1 * XSCL)
			y= float(y1 * YSCL)
			slope = dy_dx(x,y)
			dx = math.sqrt( DISTANCE/( 1+math.pow(slope,2) ) )
			dy = slope*dx
			fileobj.write(str(x) + " " + str(y) + " " + str(dx) + " " + str(dy) + "\n")
	fileobj.close()


	try:
		check_call(["gnuplot","-e","set terminal png size 800,600 enhanced font \"Arial,12\"; set xrange [" + str(XMIN) + ":" + str(XMAX) + "]; set yrange [" + str(YMIN) + ":" + str(YMAX) + "]; set output 'output.png'; plot 'data.txt' using 1:2:3:4 with vectors"])
	except (CalledProcessError, OSError):
		print "Error: gnuplot not found on system!"
		exit(1)
	print "Saved image to output.png"
	call(["xdg-open","output.png"])
	return 0

if __name__ == '__main__':
	main()
