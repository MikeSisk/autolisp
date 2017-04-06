;;;;
;;;; bold.lsp -- Program to Hilight a string of text from the
;;;;             first char to a token.
;;;;
;;;; 7/23/93 by Mike Sisk
;;;;
;;;;
;;;; Note:  Will only work on text that is left justified.
;;;;

;;;
;;; Global variables
;;;

(setq Bold_Text_Layer   "TEXT_BOLD"
	  Token				":"
	  );setq

;;;
;;; Main Function
;;;

(defun c:bold ()
  (setq Entity (Select_Entity "\nPick Text to Bold: ")
  		Text (Parse_String (Parse_Text Entity) "Token" )
		New_Entity (subst (cons 1 Text)
						 (assoc 1 Entity)
						 entity
						 );subst
		New_Entity2 (subst (cons 8 Bold_Text_Layer)
						  (assoc 8 New_Entity)
						  New_Entity
						  ); subst
		);setq
  (entmake new_Entity2)


  );defun
(princ)

;;;
;;; Common functions
;;;

(defun Parse_String ( String Token /)
  (setq Count 1
		String_Length (strlen String)
		);setq
  (while
   (<= Count String_Length)
   (progn
	(if
	 (= (substr String Count 1) Token)
	 (progn
	  (setq Length_To_Token Count
			Count String_Length
			);setq
	  );progn
	  );if
	(setq Count (1+ Count))
	);progn
   );while
  (substr String 1 Length_To_Token)
  );defun


(defun Select_Entity ( Prompt /)
		(entget (car (entsel Prompt)))
  );defun

(defun Parse_Text ( Entity /)
  (cdr (assoc 1 Entity))
  );defun



