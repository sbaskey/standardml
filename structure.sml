
(*structures*)
structure intLT =
struct
  type t=int
  val lt=(op<)
  val eq =(op=)
end

structure intDIV =
struct
type t=int
fun lt(m,n)=(n mod m)
val eq=(op=)
end

(*signatures*)
signature ordered =
sig
  type t
  val lt:t*t->bool
  val eq:t*t->bool
end

signature int_ordered =
sig
  type t=int
  val lt:t*t->bool
  val eq:t*t->bool

end

(*structure ascription
transparent ascription*)
structure IntLT : ordered = struct
  type t = int
  val lt = (op <)
  val eq = (op =)
end