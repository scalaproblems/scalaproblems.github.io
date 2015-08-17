---
layout: default
---

# MaxCounters

[Codility Results](https://codility.com/demo/results/demo7RX587-FRJ/)

{% highlight scala linenos %}
import scala.collection.JavaConversions._

object Solution {
  def solution(N: Int, A: Array[Int]): Array[Int] = {

    @scala.annotation.tailrec
    def loop(index: Int, counters: Map[Int, Int], curMax: Int, floor: Int): Array[Int] = {
      if (index >= A.length) {
        val result = Array.fill(N)(0)
        (1 to N) foreach { counter =>
          val counterValue = counters.getOrElse(counter, 0) + floor
          result(counter - 1) = counterValue
        }
        result
      } else {
        val currentValue = A(index)
        if (currentValue >= 1 && currentValue < (N + 1)) {
          val nextCounterValue = counters.getOrElse(currentValue, 0) + 1
          val nextMax = curMax max nextCounterValue
          val nextCounters = counters + (currentValue -> nextCounterValue)
          loop(index + 1, nextCounters, nextMax, floor)
        } else if (currentValue == (N + 1)) {
          val nextFloor = floor + curMax
          loop(index + 1, Map.empty, 0, nextFloor)
        } else {
          sys.error("Unexpected input")
        }
      }
    }

    loop(0, Map.empty, 0, 0)
  }
}
{% endhighlight %}