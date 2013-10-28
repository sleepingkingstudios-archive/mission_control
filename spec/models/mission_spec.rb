# spec/models/mission_spec.rb

require 'spec_helper'

RSpec.describe Mission do
  describe '::status' do
    specify { expect(described_class).to respond_to(:status).with(0).arguments }
    specify { expect(described_class.status).to be_a Array }

    specify { expect(described_class.status).to include 'planned' }
    specify { expect(described_class.status).to include 'cancelled' }
    specify { expect(described_class.status).to include 'in progress' }
    specify { expect(described_class.status).to include 'success' }
    specify { expect(described_class.status).to include 'failure' }
  end # describe

  let(:user)       { FactoryGirl.build_stubbed :user }
  let(:attributes) { { :user => user } }
  let(:instance)   { FactoryGirl.build :mission, attributes }

  describe '#user' do
    specify { expect(instance).to respond_to(:user).with(0).arguments }
    specify { expect(instance.user).to be == user }

    specify 'id setter updates the relation' do
      new_user = FactoryGirl.create :user
      expect {
        instance.user_id = new_user.id
      }.to change(instance, :user).to(new_user)
    end # specify

    specify 'setter updates the relation' do
      new_user = FactoryGirl.build_stubbed :user
      expect {
        instance.user = new_user
      }.to change(instance, :user).to(new_user)
    end # specify
  end # describe

  describe '#name' do
    specify { expect(instance).to have_property(:name) }
  end # describe

  describe '#status' do
    specify { expect(instance).to have_property(:status) }

    specify 'is "planned"' do
      expect(instance.status).to be == 'planned'
    end # specify
  end # describe

  describe '#cancelled?' do
    specify { expect(instance).to respond_to(:cancelled?).with(0).arguments }
    specify 'checks the status' do
      expect {
        instance.status = 'cancelled'
      }.to change(instance, :cancelled?).from(false).to(true)
    end # specify
  end # describe

  describe '#failure?' do
    specify { expect(instance).to respond_to(:failure?).with(0).arguments }
    specify 'checks the status' do
      expect {
        instance.status = 'failure'
      }.to change(instance, :failure?).from(false).to(true)
    end # specify
  end # describe

  describe '#in_progress?' do
    specify { expect(instance).to respond_to(:in_progress?).with(0).arguments }
    specify 'checks the status' do
      expect {
        instance.status = 'in progress'
      }.to change(instance, :in_progress?).from(false).to(true)
    end # specify
  end # describe

  describe '#planned?' do
    let(:attributes) { super().update :status => 'in progress' }

    specify { expect(instance).to respond_to(:planned?).with(0).arguments }
    specify 'checks the status' do
      expect {
        instance.status = 'planned'
      }.to change(instance, :planned?).from(false).to(true)
    end # specify
  end # describe

  describe '#success?' do
    specify { expect(instance).to respond_to(:success?).with(0).arguments }
    specify 'checks the status' do
      expect {
        instance.status = 'success'
      }.to change(instance, :success?).from(false).to(true)
    end # specify
  end # describe

  describe 'validation' do
    specify { expect(instance).to be_valid }

    describe 'name' do
      describe "can't be blank" do
        let(:attributes) { super().update :name => nil }

        specify 'has errors' do
          expect(instance).to have_errors.on(:name).with_message(/can't be blank/)
        end # specify
      end # describe

      describe 'has already been taken' do
        let(:mission)    { FactoryGirl.create :mission, :user => user }
        let(:attributes) { super().update :name => mission.name }

        specify 'has errors' do
          expect(instance).to have_errors.on(:name).with_message(/has already been taken/)
        end # specify

        describe 'with a different user' do
          let(:user)    { FactoryGirl.create :user }
          let(:mission) { FactoryGirl.create :mission, :user => FactoryGirl.create(:user) }

          specify 'does not have errors' do
            expect(instance).to be_valid
          end # specify
        end # describe
      end # describe
    end # describe

    describe 'status' do
      describe "can't be blank" do
        let(:attributes) { super().update :status => nil }

        specify 'has errors' do
          expect(instance).to have_errors.on(:status).with_message(/can't be blank/)
        end # specify
      end # describe

      describe 'must be cancelled, ...' do
        let(:attributes) { super().update :status => 'not going to space today' }

        specify 'has errors' do
          expect(instance).to have_errors.on(:status).with_message(/must be cancelled/)
        end # specify
      end # describe
    end # describe

    describe 'user' do
      describe "can't be blank" do
        let(:attributes) { super().update :user => nil }

        specify 'has errors' do
          expect(instance).to have_errors.on(:user).with_message(/can't be blank/)
        end # specify
      end # describe
    end # describe
  end # describe
end # describe
