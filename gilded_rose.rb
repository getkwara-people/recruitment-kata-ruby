class GildedRose
  def initialize(items)
    @items = items
  end

  QUALITY_UP_ITEMS = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert"].freeze
  LEGENDARY_ITEMS = ["Sulfuras, Hand of Ragnaros"].freeze # Right now we only have 1 legendary item, but who knows what adventures await us!

  def update_quality()
    @items.each do |item|
      next if LEGENDARY_ITEMS.include?(item.name)

      item.sell_in-- unless LEGENDARY_ITEMS.include?(item.name)

      if !QUALITY_UP_ITEMS.include?(item.name) && item.quality.positive?
        degradation_rate = item.sell_in < 0 ? 2 : 1
        degradation_rate = degradation_rate * 2 if item.conjured?
        item.quality = item.quality - degradation_rate
        end
      else
        if item.quality < 50
          item.quality++
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if sell_in == 0
              item.quality = 0
            else
              if item.sell_in < 11 && item.quality < 50
                item.quality = item.quality + 1
              elsif item.sell_in < 6 && item.quality < 49
                item.quality = item.quality + 2
              end
            end
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
