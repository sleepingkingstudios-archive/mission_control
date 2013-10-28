# spec/models/user_spec.rb

require 'spec_helper'

RSpec.describe User do
  let(:attributes) { {} }
  let(:instance)   { FactoryGirl.build :user, attributes }

  describe '#missions' do
    specify { expect(instance).to respond_to(:missions).with(0).arguments }
    specify { expect(instance.missions).to be == [] }

    context 'with many missions' do
      let(:instance) { super().tap &:save! }
      let(:missions) do
        [*0..2].map { FactoryGirl.create :mission, :user => instance }
      end # let

      specify { expect(instance.missions).to be == missions }
    end # context
  end # describe

  describe '#role' do
    specify { expect(instance).to have_property(:role) }

    specify 'is "user"' do
      expect(instance.role).to be == 'user'
    end # specify
  end # describe

  describe '#admin?' do
    specify { expect(instance).to respond_to(:admin?).with(0).arguments }

    specify { expect(instance).not_to be_admin }
  end # describe

  context 'with an admin user' do
    let(:instance) { FactoryGirl.build :admin, attributes }

    describe '#role' do
      specify 'is "admin"' do
        expect(instance.role).to be == 'admin'
      end # specify
    end # describe

    describe '#admin?' do
      specify { expect(instance).to be_admin }
    end # describe
  end # context
end # describe
