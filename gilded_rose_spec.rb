require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    context 'when the item is "normal"' do
      it 'reduces the quality by one' do
        sell_in = 10
        quality = 5
        item = Item.new('foo', sell_in, quality)
        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality - 1)
      end

      it 'keeps sulfuras legendary' do
        sell_in = 10
        quality = 80
        item = Item.new('Sulfuras, Hand of Ragnaros', sell_in, quality)
        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality)
      end

      it 'degrades twice fast after sell_in date' do
        sell_in = 0
        quality = 80
        item = Item.new('foo', sell_in, quality)
        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality - 2)
      end

      it 'degrades new conjured items twice fast' do
        sell_in = 1
        quality = 20
        item = Item.new('Conjured gloves', sell_in, quality)
        service = GildedRose.new([item])
        service.update_quality

        expect(item.quality).to eq(quality - 2)
        service.update_quality
        expect(item.quality).to eq(quality - 6)
      end

      it 'upgrades Brie quality over time' do
        sell_in = 10
        quality = 20
        item = Item.new('Aged Brie', sell_in, quality)
        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality + 1)
      end

      context 'backstage pass' do
        item_name = 'Backstage passes to a TAFKAL80ETC concert'
        
        it 'increases the value normally when more than 10 days' do
          sell_in = 11
          quality = 20
          item = Item.new(item_name, sell_in, quality)
          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality + 1)
        end

        it 'increases the value x2 when there are 10 days for the concert' do
          sell_in = 10
          quality = 20
          item = Item.new(item_name, sell_in, quality)
          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality + 2)
        end

        it 'increases the value x3 when there are 10 days for the concert' do
          sell_in = 5
          quality = 20
          item = Item.new(item_name, sell_in, quality)
          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality + 3)
        end

        it 'destroys the quality when concert passed' do
          sell_in = 0
          quality = 20
          item = Item.new(item_name, sell_in, quality)
          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(0)
        end
      end
    end
  end
end
