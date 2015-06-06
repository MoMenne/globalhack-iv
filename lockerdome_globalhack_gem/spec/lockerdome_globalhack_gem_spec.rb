require 'spec_helper'

describe LockerdomeGlobalhackGem do

  before { LockerdomeGlobalhackGem.initialize '7740569476399170', '8dva9NuHjUvfZV9aLCdMyDQ5EWaHTb3XBQCt5OWGtD+oL3JN3+QnoS7TWRcsFQsnU4BaHDbmpnoflw9/L6b28Q==' }

  it 'has a version number' do
    expect(LockerdomeGlobalhackGem::VERSION).not_to be nil
  end

  it 'does something useful' do
    content = LockerdomeGlobalhackGem.create_content
    expect(content.code).to be== 200
  end
end
