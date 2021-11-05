package example

import scala.collection.GenMap as *

class A
class B
class C
trait D[T]

object Simple:
  extension (sbd: String)
    def double = sbd + sbd
    def double2 = sbd + sbd
  end extension
  "".double2
end Simple

object Advanced:

  extension [T](using A)(s: T)(using B)
    def double[G](using C)(times: G) = (s.toString + s.toString)
  end extension

  given A with {}

  given B with {}

  given C with {}
  val b = B()
  val c = C()

  val name = Option("Bob")

  def foo[T: D](a: Int) = ???

  "".double(using b)[Int](using c)(1)

end Advanced

object RightAssoc:
  extension [T](using A)(main: T)(using B) def %:[R](res: R)(using C): R = ???
  given A with {}
  given b: B = B()

  given c: C = C()
  "".%:(11)(using b)(using c)

end RightAssoc

object Multi:
  extension (s: String) def hello2 = ""

  extension (s: String) def hello = ""

  "".hello
end Multi
