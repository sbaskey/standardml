
  1 https://www.cs.cornell.edu/courses/cs312/2004fa/lectures/lecture3.html

  (* length : 'a list -> int *)
  2 fun length nil = 0 | length (x::xs) = 1 + (length xs);
  3 
  4 (* reverse : 'a list -> 'a list *)
  5 fun reverse nil = nil | reverse (x::xs) = (reverse xs) @ [x];
  6 
  7 (* map : ('a -> 'b) * 'a list -> 'b list *)
  8 fun map (f,nil) = nil | map (f,x::xs) = f(x) :: (map (f,xs));
  9 
 10 (* filter : ('a -> bool) * 'a list -> 'a list *)
 11 fun filter (p,nil)   = nil
 12  |  filter (p,x::xs) = if p x then x::(filter(p,xs)) else filter (p,xs);
 13 
 14 (* exists : ('a -> bool) -> 'a list -> bool *)
 15 fun exists (p,nil) = false | exists (p,x::xs) = p x orelse exists (p,xs);
 16 
 17 (* all : ('a -> bool) * 'a list -> bool *)
 18 fun all (p,nil) = true | all (p,x::xs) = p x andalso all (p,xs);
 19 
 20 exists (fn x=>x>0, [~1,~34,0]);
 21 all (fn x=>x<=0, [~1,~34,0]);
 22 all (not o (fn x=>x>0), [~1,~34,0]);
 23 
 24 (* foldr : ('a * 'b -> 'b) * 'b * 'a list -> 'b *)
 25 fun foldr (f,ie,nil)   = ie
 26  |  foldr (f,ie,x::xs) = f (x, foldr (f,ie,xs));
 27 
 28 foldr (op -, 0, [3,4]);
 29 
 30 (* foldl : ('a * 'b -> 'b) * 'b * 'a list -> 'b *)
 31 fun foldl (f,ie,nil)   = ie
 32  |  foldl (f,ie,x::xs) = foldl (f, f(x,ie), xs);
 33 
 34 foldl (op -, 0, [3,4]);
 35 
 36 (* map : ('a -> 'b) -> 'a list -> 'b list *)
 37 fun map f nil = nil | map f (x::xs) = (f x) :: (map f xs)
 38 
 39 (* filter : ('a -> bool) -> 'a list -> 'a list *)
 40 fun filter p nil = nil
 41  |  filter p (x::xs) = if p(x) then x :: (filter p xs) else filter p xs
 42 
 43 (* exists : ('a -> bool) -> 'a list -> bool *)  
 44 fun exists p nil = false | exists p (x::xs) = p(x) orelse exists p xs
 45 
 46 (* all : ('a -> bool) -> 'a list -> bool *)
 47 fun all p nil = true | all p (x::xs) = p(x) andalso all p xs
 48 
 49 (* foldr : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)
 50 fun foldr f ie nil     = ie
 51  |  foldr f ie (x::xs) = f (x, foldr f ie xs);
 52 
 53 (* foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)
 54 fun foldl f ie nil     = ie
 55  |  foldl f ie (x::xs) = foldl f (f(x,ie)) xs;
 56 
 57 foldr (op +)  0   [1,2,3,4,5,6,7,8,9];
 58 foldr (op * ) 1.0 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
 59 foldr (op ^)  ""  ["a","bc","def","","ghij"];
 60 foldr (op @)  nil [[1],[2,3],[4,5,6],[],[7,8,9,0]];
 61 foldr (op ::) nil [1,2,3,4,5,6,7];
 62 foldl (op ::) nil [1,2,3,4,5,6,7];