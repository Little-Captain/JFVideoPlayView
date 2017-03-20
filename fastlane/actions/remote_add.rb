# action description: remote_add(remoteURL: 远程地址, remoteName: 远程仓库别名)
# 简便的调用: remote_add(remoteURL: 远程地址), 这时第二参数为: origin
module Fastlane
  module Actions
    module SharedValues
      REMOTE_ADD_CUSTOM_VALUE = :REMOTE_ADD_CUSTOM_VALUE
    end

    class RemoteAddAction < Action
      def self.run(params)
        remoteURL = params[:remoteURL]
        remoteName = params[:remoteName]
        # 这一步用于校验是否存在这个远程仓库别名, 存在, 我们就删除, 不删除会报错
        if Actions.sh("git remote").rstrip == remoteName
          Actions.sh("git remote rm #{remoteName}")
        end
        Actions.sh("git remote add #{remoteName} #{remoteURL}")
      end

      def self.description
        "自己定义的action, 可以为本地仓库添加远程地址"
      end

      def self.details
        "你可以使用这个action, 来为本地仓库添加远程地址, so cool"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :remoteURL,
                                       env_name: "REMOTEURL", # The name of the environment variable
                                       description: "远程仓库的地址", # a short description of this parameter
                                       is_string: true, 
                                       optional: false
                                       ),
          FastlaneCore::ConfigItem.new(key: :remoteName,
                                       env_name: "REMOTENAME",
                                       description: "远程仓库别名",
                                       is_string: true, # true: verifies the input is a string, false: every kind of value
                                       optional: true,
                                       default_value: "origin"
                                       )
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['REMOTE_ADD_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If you method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Little-Captain"]
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        platform == :ios
      end
    end
  end
end
