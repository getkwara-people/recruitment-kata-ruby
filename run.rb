#!/usr/bin/ruby -w

require 'terminal-table'
require File.join(File.dirname(__FILE__), 'gilded_rose')

puts "Welcome to the Gilded Rose!"

items = [
  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

days = 10
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new(items)
(0...days).each do |day|
  puts Terminal::Table.new(
    title: "Day #{day}",
    headings: ["Name", "Sell in", "Quality"],
    rows: items.map { |i| i.to_h.values }
  )

  puts
  gilded_rose.update_quality
end