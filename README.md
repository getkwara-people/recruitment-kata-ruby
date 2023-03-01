# Gilded Rose

## Welcome

Welcome to our kata!
Below you will find the details of the exercise.

Please clone it to your machine, work on your solution and then upload the full repo to your own profile on Github. **Please, don't open a PR to this repo!**

Some points for you to consider:

- We appreciate if you could git commit each relevant step of your development.
- There's no hard deadline, we'd appreciate if you could submit your solution within 4 days. If you need more time just send us an email to inform us and it will be no problem.

Please add a quick explanation in a separate README file where you clarify your general approach. Of particular interest is tradeoffs you may have made, and the reasoning for making them.
Feel free to add your feedback to this coding challenge in the README as well.

Once finished please:

1. upload to a private repo under your personal Github profile
2. open a PR against it with your solution
3. transfer the ownership of the repo to the account of the person you were in contact with (ask us in case you are unsure about this - should be provided in the email you received)

If you have any additional questions just write us an email and we will reply as soon as possible.

Good luck!

## Exercise

Welcome to team Gilded Rose. We are a small inn with a prime location in a prominent city, run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by an engineer who has moved on to new adventures.

Your task is to add a new feature to our system so that we can begin selling a new category of items.

First an introduction to our system:

- All items have a `sell_in` value which denotes the number of days we have to sell the item
- All items have a `quality` value which denotes how valuable the item is
- At the end of each day, our system lowers both values for every item

Sounds simple, right? Here is where it gets interesting:

- Once the sell by date has passed, `quality` degrades twice as fast
- The `quality` of an item is never negative
- "Aged Brie" actually _increases_ in `quality` the older it gets
- The `quality` of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in `quality`
- "Backstage passes", like aged brie, increase in `quality` as the `sell_in` value approaches:
  - `quality` increases by 2 when there are 10 days or less, and by 3 when there are 5 days or less
  - `quality` drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in `quality` twice as fast as normal items

Feel free to make any changes to the `update_quality` method and add any new code, as long as everything
still works correctly.

(Oh, and just for clarification, an item can never have a `quality` above 50, however "Sulfuras" is a
legendary item and as such its `quality` is 80 and it never changes.)
