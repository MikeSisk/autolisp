
(defun C:AE ()
    (setvar "CMDECHO" 0)
     (setq str1 (getstring "NEW ATTRIBUTE VALUE:"))
      (command "ATTEDIT" "" "" "" "" pause "" "V" "R" str1 "")
      (princ)
)

(defun C:AP ()
    (setvar "CMDECHO" 0)
     (setq pnt1 (getpoint "SELECT NEW ATTRIBUTE LOCATION:"))
      (command "ATTEDIT" "" "" "" "" pause "" "P" PNT1 "")
      (princ)
)

(defun C:B ()
     (setvar "CMDECHO" 0)
     (princ "\nSelect objects to BREAK: ")
     (setq SS (ssget))
     (setq BP1 (getpoint "\nEnter first BREAK POINT: "))
     (setq BP2 (getpoint "\nEnter second BREAK POINT: "))
     (if SS
       (progn
         (setq L 0 LN (sslength SS))
         (while (< L LN)
           (setq EN (ssname SS L))
             (while
               (command "BREAK" EN BP1 BP2)
             )
           (setq L (1+ L))
     ) ) )
)

(defun C:C ()
     (setvar "CMDECHO" 0)
      (command "COPY" )
)

(defun C:CC ()
     (setvar "CMDECHO" 0)
      (command "COPY" "C" )
)

(defun C:CW ()
     (setvar "CMDECHO" 0)
      (command "COPY" "W" )
)

(defun C:CT ()
     (setvar "CMDECHO" 0)
      (princ "\nSelect object to be CHANGE: ")
      (setq ss (ssget))
      (if SS
       (progn
         (setq L 0 LN (sslength SS))
         (while (< L LN)
           (setq EN (ssname SS L))
           (setq EN1 (cdr(assoc 1(entget EN))))
           (princ "\nOLD TEXT: ")(princ EN1)
           (princ "     \n")
           (setq TXT (getstring T "\nEnter new TEXT: "))
             (while
             (command "CHANGE" EN "" "" "" "" "" "" TXT)
             )
           (setq L (1+ L))
     ) ) )
)

(defun C:CTH ()
     (setvar "CMDECHO" 0)
      (princ "\nSelect object to be CHANGE: ")
      (setq ss (ssget))
      (setq H (rtos(getreal "\nEnter NEW HEIGHT: ")2 4))
      (if SS
       (progn
         (setq L 0 LN (sslength SS))
         (while (< L LN)
           (setq EN (ssname SS L))
             (while
             (command "CHANGE" EN "" "" "" "" H "" "")
             )
           (setq L (1+ L))
     ) ) )
)

(defun C:CTS ()
     (setvar "CMDECHO" 0)
      (princ "\nSelect object to be CHANGE: ")
      (setq ss (ssget))
      (setq S (getstring T "\nEnter NEW TEXT STYLE: "))
      (if SS
       (progn
         (setq L 0 LN (sslength SS))
         (while (< L LN)
           (setq EN (ssname SS L))
             (while
             (command "CHANGE" EN "" "" "" S "" "" "")
             )
           (setq L (1+ L))
     ) ) )
)

(defun C:CPC ()
     (setvar "CMDECHO" 0)
      (princ "\nSelect objects to be CHANGE: ")
      (setq ss (ssget))
      (setq C (getstring T "\nEnter NEW COLOR NUMBER: "))
      (command "CHANGE" ss "" "P" "C" C "")
)

(defun C:CPL ()
     (setvar "CMDECHO" 0)
      (princ "\nSelect objects to be CHANGE: ")
      (setq ss (ssget))
      (setq LA (getstring T "\nEnter NEW LAYER: "))
      (command "CHANGE" ss "" "P" "LA" LA "")
)

(defun C:CL ()
     (setvar "CMDECHO" 0)
     (princ "\nSelect objects to be CHANGE: ")
     (setq ss (ssget))
     (if ss (progn
       (setq e (car (entsel "\nPick an object on the desired LAYER: ")))
       (if e (progn
         (setq e (entget e))
         (setq n (cdr (assoc 8 e)))
         (command "CHANGE" ss "" "PROP" "LAYER" n "")
   )) ))
)

(defun C:CCO ()
     (setvar "CMDECHO" 0)
     (princ "\nSelect objects to be CHANGE: ")
     (setq ss (ssget))
     (if ss (progn
       (setq e (car (entsel "\nPick an object with the desired COLOR: ")))
       (if e (progn
         (setq e (entget e))
         (setq n (cdr (assoc 62 e)))
         (command "CHANGE" ss "" "PROP" "COLOR" n "")
   )) ))
)

(defun C:DLD ()
     (setvar "cmdecho" 0)
        (command "DLDCLEAN" )
)

(defun c:SL ()
     (setvar "CMDECHO" 0)
     (setq LAYER(cdr(assoc 8(entget(car
        (entsel "\nPick item for new LAYER:  "))))))
     (command "LAYER" "SET" layer "")
)

(defun C:E ()
     (setvar "cmdecho" 0)
        (command "ERASE" )
)

(defun C:EC ()
     (setvar "cmdecho" 0)
        (command "ERASE" "C")
)

(defun C:EW ()
     (setvar "cmdecho" 0)
        (command "ERASE" "W")
)

(defun C:EP ()
     (setvar "CMDECHO" 0)
        (command "EXPLODE" )
)

(defun C:F ()
     (setvar "CMDECHO" 0)
       (setq rad (getreal "\nEnter FILLET RADIUS: "))
        (command "FILLET" "R" RAD)
        (command "FILLET" )
)

(defun C:I ()
     (setvar "CMDECHO" 0)
     (setvar "ORTHOMODE" 1)
     (command "INSERT")
)

(defun C:LA ()
     (setvar "CMDECHO" 0)
        (command "LAYER" )
)

(defun C:M ()
     (setvar "CMDECHO" 0)
        (command "MOVE" )
)

(defun C:MC ()
     (setvar "CMDECHO" 0)
        (command "MOVE" "C")
)

(defun C:MW ()
     (setvar "CMDECHO" 0)
        (command "MOVE" "W")
)

(defun C:P ()
     (setvar "CMDECHO" 0)
     (setvar "ORTHOMODE" 1)
        (command "PAN" )
)

(defun C:PE ()
     (setvar "CMDECHO" 0)
        (command "PEDIT" )
)

(defun C:PT ()
     (setvar "CMDECHO" 0)
        (command "POINT" )
)

(defun C:Q ()
     (setvar "CMDECHO" 0)
        (command "QUIT" "Y" )
)

(defun C:R ()
     (setvar "CMDECHO" 0)
        (command "RENAME" )
)

(defun C:RT ()
     (setvar "CMDECHO" 0)
     (setvar "ORTHOMODE" 0)
      (princ "\nSelect objects to ROTATE: ")
      (setq ss (ssget))
      (setq BP (getpoint "\nSelect BASE POINT: "))
      (setq FP (getpoint "\nSelect FROM POINT: "))
      (setq TP (getpoint FP "\nSelect TO POINT: "))
      (setq A (angtos (-(angle BP TP)(angle BP FP)) 0 6))
      (command "ROTATE" SS "" BP A)
)

(defun C:S ()
     (setvar "CMDECHO" 0)
        (command "STRETCH" "C")
)

(defun C:SA ()
     (setvar "CMDECHO" 0)
        (COMMAND "DLDCLEAN")
        (command "SAVE" "")
)

(defun C:ZI ()
     (setvar "CMDECHO" 0)
       (setq PT(getpoint "\nCenter of window: "))
         (setq IN (*(getvar "VIEWSIZE") 0.5))
           (command "ZOOM" "C" PT IN)     ;ZOOMS IN 75% SCREEN SIZE
)

(defun C:ZA ()
     (setvar "CMDECHO" 0)
        (command "ZOOM" "A" )     ;ZOOMS ALL
)

(defun C:ZE ()
     (setvar "CMDECHO" 0)
        (command "ZOOM" "E" )     ;ZOOMS EXTENTS
)

(defun C:ZP ()
     (setvar "CMDECHO" 0)
        (command "ZOOM" "P" )     ;ZOOMS PREV
)

(defun C:ZW ()
     (setvar "CMDECHO" 0)
        (command "ZOOM" "W" )     ;ZOOMS WINDOW
)

(defun C:ZD ()
     (setvar "CMDECHO" 0)
        (command "ZOOM" "D" )     ;ZOOMS DYNAMIC
)

;The dtr function converts degrees to radians
;The rtd function converts radians to degrees
(vmon)
(defun dtr (a)
  (* pi (/ a 180.0))
  )
;
(defun rtd (a)
  (/ (* a 180.0) pi)
)

;This LISP routine will draw a line at
;an angle that you supply from a point you pick
(defun c:angle (/ pnt1 pnt2 pnt3 a b c d)
  (graphscr)
  (setvar "cmdecho" 0)
  (setq pnt1 (getpoint "Pick base point: ")) (terpri)
  (setq pnt2 (getpoint pnt1 "Pick second point: ")) (terpri)
  (setq a (getangle "enter angle: ")) (terpri)
  (setq b (getreal "Enter distance: ")) (terpri)
  (setq c (angle pnt1 pnt2))
  (setq d (+ a c))
  (setq pnt3 (polar pnt1 d b))
  (command "line" pnt1 pnt3 "" )
)

;* DXF takes an integer dxf code and an entity data list.
;* It returns the data element of the associated pair.
(defun dxf(code elist)
  (cdr (assoc code elist))  ;finds the association pair, strips first element
);defun
;*

;==========================================
;               CLEAN,LSP
;  This file should be loaded before any
;  that you might want to clean out of
;  your system.
;==========================================
(defun c:clean ()
   (setq ATOMLIST (member 'C:CLEAN atomlist))
   'DONE
);END DEFUN CLEAN
