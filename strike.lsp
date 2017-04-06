; @(#)strike.lsp	1.3
; 6/11/93
;
;*********************************************************************
;** STRIKE.LSP -- Plots geologic stike & dip symbols on basemap.    **
;**
;**
;**
;**
;**                 (C) Copyright 1993 by Mike Sisk                 **
;*********************************************************************
;

;-- Set global variables


(setq
  StrikeTextSize                ".05"
  StrikeTextOffset              "0.05"
  ); setq

(command "ANGDIR"  1)
(command "ANGBASE" 270)

(if (tblsearch "style" "strike")
  (setvar "textstyle" "strike")
  (progn
   (command ".style" "strike" "romans" "0.0" ".8" "" "" "" "")
   ); progn
  ); if


(defun c:s1 (/)
  (repeat 10000
   (strikeplot "strike1")
   ); repeat
   ); defun

(defun c:s2 (/)
  (repeat 10000
  (strikeplot "strike2")
  ); repeat
  ); defun

(defun c:s3 (/)
  (repeat 10000
  (strikeplot "strike3")
  ); repeat
  ); defun

(defun c:s4 (/)
  (repeat 10000
  (strikeplot "strike4")
  ); repeat
  ); defun

(defun c:s5 (/)
  (repeat 10000
  (strikeplot "strike5")
  ); repeat
  ); defun



;
;-- Get input from keyboard
;   Input to be in the form of:
;               100/53
;                ^  ^
;                |  |__ dip angle
;                |_____ strike angle measured in degrees
;                                counter-clockwise
;

(defun strikeplot (filename /)

(initget 1)
(setq Location (getpoint "\nEnter the location of the strike symbol <ctrl-c to quit>:  "))

  (if (= 1 (getvar "ANGDIR"))
	  
	  (setq Strike (- 360 (* (ReturnAngle 0 "" "Enter the angle of the strike  "
										  nil Location)(/ 180 PI))))

  	  (setq Strike (* (ReturnAngle 0 "" "Enter the angle of the strike  " nil 
								   Location)(/ 180 PI)))
	  
	  ); if


; Strike (getint "\nEnter the angle of the strike:  ")

  (setq Dip (getint "\nEnter the angle of the dip:  ")
  ); setq


;
;-- Insert symbol 
;

(command ".insert" filename Location "1" "1" Strike )

;
;-- conditional statement to determine placement of dip
;    angle text.
;

(cond
        ((and (>= strike 0 ) (< strike 90 ))
         (command ".text"
				  "s" "strike"
				  "j"
				  "r"
                          (list
                           (- (car Location)(atof StrikeTextOffset))
                           (- (cadr Location)(atof StrikeTextOffset))
                           ); list
                          (atof StrikeTextSize)
                          "90"
                          dip
                          ); command
         ); first case
  
        ((and (>= strike 90 ) (< strike 180 ))
         (command ".text"
				  "s" "strike"
				  "j"
				  "r"
                          (list
                           (- (car Location)(atof StrikeTextOffset))
                           (+ (cadr Location)(atof StrikeTextOffset))
                           ); list
                          (atof StrikeTextSize)
                          "90"
                          dip
                          ); command
         ); second case
  
        ((and (>= strike 180 ) (< strike 270 ))
         (command ".text"
				  "s" "strike"
                          (list
                           (+ (car Location)(atof StrikeTextOffset))
                           (+ (cadr Location)(atof StrikeTextOffset))
                           ); list
                          (atof StrikeTextSize)
                          "90"
                          dip
                          ); command
         ); third case

        ((and (>= strike 270 ) (< strike 360 ))
         (command ".text"
				  "s" "strike"
                          (list
                           (+ (car Location)(atof StrikeTextOffset))
                           (- (cadr Location)(atof StrikeTextOffset))
                           ); list
                          (atof StrikeTextSize)
                          "90"
                          dip
                          ); command
         ); fourth case
       
  ); cond
); defun




(defun ReturnAngle (			; formal parameter list 
									
					bit 		; bit code for initget
					keyword 	; keyword for initget 
					message		; prompt message text 
					default		; default return value
					basepoint	; basepoint for 'rubber band'
					/ input		; local variable for input
					
					); end parameter list 

  (if default
	  (setq message (strcat "\n" message "<" (angtos default) ">: ")
			bit (- bit (boole 1 bit 1))
			); setq
	  (if (= " " (substr message (strlen message) 1))
		  (setq message (strcat "\n" (substr message 1
								(1- (strlen message))) ": "))
	  (setq message (strcat "\n" message ": "))
	  ); if
  ); if

(initget bit keyword)

(setq input
  (if basepoint
	  (getangle message basepoint)
	  (getangle message)
	  ); if

  ); setq

(if input input default)

); defun


(princ)
