#!/usr/bin/env sh
exec guile -x .w --language=wisp --auto-compile -s "$0" "$@"
!#

define-module : slopefield
  . #:export : main
  
define : dy/dx x y
  if : zero? y
    . +inf.0
    / x y

define x-min -8.0
define x-max 8.0
define y-min -8.0
define y-max 8.0
define x-scl 1
define y-scl 1

define distance 0.4

define : int num
  let : : n : round num
    if : inexact? n
      inexact->exact n
      . n

define : range min max
  "only consider situation where min max are all integers and min<max pre-satisfied"
  let loop : : stepper min
    if : > stepper max
      . '()
      cons stepper : loop : 1+ stepper

define : main args
  define file : open-output-file "data.txt"
  map
    lambda : x1 y1
      define x : * x1 x-scl
      define y : * y1 y-scl
      define slope : dy/dx x y
      define dx : sqrt : / distance : 1+ : expt slope 2
      define dy : * slope dx
      display
        string-append : number->string x
                        . " "
                        number->string y
                        . " "
                        number->string dx
                        . " "
                        number->string dy
        . file
      newline file
      
    range : int : / x-min x-scl
            int : / x-max x-scl
    range : int : / y-min y-scl
            int : / y-max y-scl
           
  system : string-append "gnuplot -e \"set terminal png size 800,600; set xrange [" (number->string x-min) ":" (number->string x-max) "]; set yrange [" (number->string y-min) ":" (number->string y-max) "]; set output 'output.png'; plot 'data.txt' using 1:2:3:4 with vectors\""
  
;;; Local Variables:
;;; mode: wisp
;;; End:
