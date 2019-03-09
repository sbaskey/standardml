signature TOTALORDER = 
sig
  type element
	val lt: element * element -> bool
end

structure String : TOTALORDER =
struct
	type element = string
	fun lt(a:string, b) = a < b
end

structure Integer: TOTALORDER = 
struct
	type element = int
	fun lt(a, b) = a < b
end


functor MakeSorter(Lt: TOTALORDER):
	sig
		val descending : Lt.element * Lt.element -> Lt.element * Lt.element
		val ascending : Lt.element * Lt.element -> Lt.element * Lt.element
	end
	=
	struct
		open Lt;

		fun descending(a,b) = if lt(a,b) then (b,a) else (a,b)
		fun ascending(a,b) = if lt(a,b) then (a,b) else (b,a)
	end

structure StringComparator = MakeSorter(String)
structure IntegerComparator = MakeSorter(Integer)


val res01 = StringComparator.ascending("arm","house")
val res02 = StringComparator.descending("arm","housr")

val res03 = IntegerComparator.ascending(1,2)
val res04 = IntegerComparator.descending(1,2)	