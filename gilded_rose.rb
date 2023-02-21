class GildedRose
  def initialize(items)
    @items = items
  end

  QUALITY_UP_ITEMS = %w("Aged Brie" "Backstage passes to a TAFKAL80ETC concert").freeze
  LEGENDARY_ITEMS = %w("Sulfuras, Hand of Ragnaros").freeze # Right now we only have 1 legendary item, but who knows what adventures await us!

  def update_quality()
    @items.each do |item|
      item.sell_in-- unless LEGENDARY_ITEMS.include?(item.name)

      if !QUALITY_UP_ITEMS.include?(item.name) && item.quality.positive?
        if !LEGENDARY_ITEMS.include?(item.name)
          if item.conjured?
            item.quality = item.quality - 2
          else
            item.quality--
          end
        end
      else
        if item.quality < 50
          item.quality++
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if sell_in == 0
              item.quality = 0
            else
              if item.sell_in < 11 && item.quality < 50
                item.quality++
              end
              if item.sell_in < 6 && item.quality < 49
                item.quality = item.quality + 2
              end
            end
          end
        end
      end

      
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality--
              end
            end
          else
            item.quality--
          end
        else
          if item.quality < 50
            item.quality++
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def conjured?
    name.downcase.include?('conjured')
  end
  
  def to_h
    { name: @name, sell_in: @sell_in, quality: @quality }
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
