---
title: bubble
date: 2020-03-10
categories: ['algorithm']
draft: false
---

```
class Array
  def bubblesort1!
    length.times do |j|
      for i in 1...(length - j)
        if self[i] < self[i - 1]
          self[i], self[i - 1] = self[i - 1], self[i]
        end
      end
    end
  end
end
```
