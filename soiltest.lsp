; @(#)soiltest.lsp	1.1
; 19 Jun 1995
;
;*********************************************************************
;**    soiltest.lsp
;**
;**
;**
;**
;**                 (C) Copyright 1993 by Mike Sisk                 **
;*********************************************************************
;


(setvar "cmdecho" 0)

(defun toggle ( layername / )
  (if (= -1 
		 (cdr (assoc 62 (tblsearch "layer" layername)))
		 )
		 (command ".layer" "on" layername "")
		 (command ".layer" "off" layername "")
	  ); if
  ); defun
(princ)

(defun c:soil (/)
  (prompt "\nPosition of test: ")(princ)
  (command ".insert" "soiltest" pause (* 1.5 (getvar "ltscale")) "" "")(princ)
  ); defun

(defun *error* (msg)
  (princ "error: ")
  (princ msg)
  (terpri)
  ); defun
(princ)
  
