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

      it 'does something else' do
        skip 'Your turn...'
      end
    end
  end
end