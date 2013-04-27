require 'spec_helper'

describe ApplicationHelper do
  describe 'render_close_icon' do
    subject { helper.render_close_icon }

    it { should have_selector('a.close') }
  end

  describe 'flash_class' do
    subject { helper.flash_class(flash_key) }
    context 'when flash key is :notice' do
      let(:flash_key) { :notice }
      it { should == 'alert-success' }
    end
    context 'when flash key is :error' do
      let(:flash_key) { :error }
      it { should == 'alert-error' }
    end
  end

  describe 'render_user_bar' do
    def render
      helper.render_user_bar
    end

    context 'when user has signed in' do
      before do
        helper.should_receive(:user_signed_in?).with().and_return(true)
      end
      it 'renders signed_in_user_bar' do
        helper.should_receive(:render).with('signed_in_user_bar').once
        render
      end
    end

    context 'when user has not yet signed in' do
      before do
        helper.should_receive(:user_signed_in?).with().and_return(false)
      end
      it 'renders signed_out_user_bar' do
        helper.should_receive(:render).with('signed_out_user_bar').once
        render
      end
    end
  end

  describe 'render_flashes' do
    context 'when it is called twice' do
      it 'only renders flashes once' do
        helper.should_receive(:render).with('common/flashes').once

        helper.render_flashes
        helper.render_flashes
      end
    end
  end

  describe 'format_tags' do
    subject { helper.format_tags(tags) }
    let(:tags) { ["python", "code"] }

    it { should eq "<span class=\"tag\"><i class=\"icon-tag\"></i><a href=\"/tags/python\">python</a></span><span class=\"tag\"><i class=\"icon-tag\"></i><a href=\"/tags/code\">code</a></span>" }
  end

  describe 'format_labels' do
    let(:labels) { ["a", "b"] }

    context "only labels" do
      subject { helper.format_labels(labels) }

      it 'with empty color and type' do
        should == "<span class=\"label\"><a href=\"/tags/a\">a</a></span><span class=\"label\"><a href=\"/tags/b\">b</a></span>"
      end
    end

    context "with labels and color" do
      subject { helper.format_labels(labels, color) }
      let(:color) { "info" }

      it 'with color of info and empty type' do
        should == "<span class=\"label label-info\"><a href=\"/tags/a\">a</a></span><span class=\"label label-info\"><a href=\"/tags/b\">b</a></span>"
      end
    end

    context "with labels, color and type" do
      subject { helper.format_labels(labels, color, type) }
      let(:color) { "info" }

      context "tag" do
        let(:type) { "tag" }
        it 'with type' do
          should == "<span class=\"label label-info\"><a href=\"/tags/a\">a</a></span><span class=\"label label-info\"><a href=\"/tags/b\">b</a></span>"
        end
      end

      context "author" do
        let(:type) { "author" }
        it 'with type' do
          should == "<span class=\"label label-info\"><a href=\"/authors/a\">a</a></span><span class=\"label label-info\"><a href=\"/authors/b\">b</a></span>"
        end
      end

      context "translator" do
        let(:type) { "translator" }
        it 'with type' do
          should == "<span class=\"label label-info\"><a href=\"/translators/a\">a</a></span><span class=\"label label-info\"><a href=\"/translators/b\">b</a></span>"
        end
      end
    end
  end
end
