module Fastlane
  module Actions
    class FlutterBuildAction < Action
      def self.run(params)
        current_folder = Dir.pwd
        if(current_folder.include?("ios")) then
          system("cd .. && flutter build ios --release --no-codesign")
        elsif(current_folder.include?("android")) then
          system("cd .. && flutter build  "+params[:type]+" --release")
        end
      end

      def self.description
        "Build our project directly from your lane."
      end

      def self.authors
        ["viniciusmo"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "A wrapper flutter build command."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :type,
                                   env_name: "FLUTTER_BUILD_TYPE",
                                description: "Choose build type",
                                   optional: false,
                                       type: String,
                                       default_value: 'apk')
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
