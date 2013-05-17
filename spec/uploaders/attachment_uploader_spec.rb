require 'carrierwave/test/matchers'

describe AttachmentUploader do # http://git.io/XhkwBw
  include CarrierWave::Test::Matchers
  let(:attachment) { Attachment.new }

  before do
    AttachmentUploader.enable_processing = true
    @uploader = AttachmentUploader.new(attachment, :image)
    @uploader.store!(File.open(path))
  end

  after do
    AttachmentUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the normal version' do
    #context 'from big image' do
      #let(:path) { Rails.root.join("spec/factories/data/attachment/book_big.jpg") } # 240 x 365
      #it "should scale down a landscape image to fit with 160*200" do
        #@uploader.should have_dimensions(132, 200) # http://j.mp/14rqhZk
      #end
    #end
    context 'from small image' do
      let(:path) { Rails.root.join("spec/factories/data/attachment/book.jpg") } # 154 x 200
      it "should not be scale down" do
        @uploader.should have_dimensions(154, 200)
      end
    end
  end
end
