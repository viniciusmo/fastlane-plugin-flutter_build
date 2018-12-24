describe Fastlane::Actions::FlutterBuildAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_build plugin is working!")

      Fastlane::Actions::FlutterBuildAction.run(nil)
    end
  end
end
