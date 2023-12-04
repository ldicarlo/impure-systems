---
layout: post
title:  "Composed unicity keys in json"
categories: "data-modeling"
---


# The problem

Sometimes when you provide an API in JSON, you may need to return lists.

When doing that, and when you have a relational database behind, you may end up with a data model like this:

```json

{
  "parent_order_id": 1,
  "package_id": "ABC",
  "last_update": "now"
}

```

Let say that, in this example, you'd have multiple packages in one order, and this API exposes you the last updated packages.

Now, imagine that in SQL behind you have a composed key on `(parent_order_id, order_package)` to be sure that there is no 2 packages with the same `package_id` for a given `order_id`.

The JSON list you provide would lose this constraint:

```json
[
  { "parent_order_id": 1,
    "package_id": "ABC",
    "last_update": "now"
  },
  { "parent_order_id": 1,
    "package_id": "ABC",
    "last_update": "yesterday" // Oh !
  }
]
```

In my experience, when seeing this case, this is what you need to do:

```json
{
  "1": {
    "ABC": {
      "last_update": "now"
    }
  }
}
```

Also in my experience, nobody will like that.

And streaming data may be inefficient.

But this will keep the unicity constraints in the model.

Everybody consuming your API will know that you cannot have 2 packages with the same `order_id` and the same `package_id`.
