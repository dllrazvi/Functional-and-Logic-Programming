; b) Write a function to get from a given list the list of all atoms, on any
; level, but reverse order. Example:
; (((A B) C) (D E)) ==> (E D C B A)


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm) , otherwise


(defun myAppend(l1 l2)
  (cond
    ((null l1) l2)
    (t (cons (car l1) (myAppend (cdr l1) l2)))
  )
)


; getAllAtoms(l1l2...ln) = 
; = NIL , if n = 0
; = myAppend(getAllAtoms(l2...ln), getAllAtoms(l1)) , if l1 is a list
; = myAppend(getAllAtoms(l2...ln), list(l1)) , otherwise

(defun getAllAtoms (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (getAllAtoms (cdr l)) (getAllAtoms (car l))))
    (t (myAppend (getAllAtoms (cdr l)) (list (car l))))
  )
)    
