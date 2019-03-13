require 'rails_helper'

RSpec.describe BookCoverHelpers do
  let(:decorator_class) do
    Class.new(SimpleDelegator) { include BookCoverHelpers }
  end

  let(:decorated_instance) { decorator_class.new(book) }

  context '#cover_url_or_default' do
    subject { decorated_instance.method(:cover_url_or_default) }

    context 'when empty' do
      let(:book) { create :book }

      it 'should provide fallback image url' do
        expect(subject.call).to include '/fallback/cover_default'
      end

      it 'should provide thumb fallback image url' do
        expect(subject.call(version: :thumb)).to include '/fallback/thumb_cover_default'
      end
    end

    context 'when non empty' do
      let(:book) { create :book, :with_cover, number_of_covers: 4 }

      it 'should provide image url' do
        expect(subject.call).to include 'image_example'
      end

      it 'should provide thumb image url' do
        expect(subject.call(version: :thumb)).to include 'thumb_image_example'
      end
    end
  end
end
