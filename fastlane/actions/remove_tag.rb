# action description: remove_tag(tagName: 标签名称, removeLocal: true/false, removeRemote: true/false)
# 简便的调用: remove_tag(tagName: 标签名称), 这时后两个参数都为: true
# 只有在双引号字符串中才可以使用 #{表达式} 来计算表达式的值, 单引号字符串不可以!!!

module Fastlane
  module Actions
    module SharedValues
      REMOVE_TAG_CUSTOM_VALUE = :REMOVE_TAG_CUSTOM_VALUE
    end

    class RemoveTagAction < Action
      def self.run(params)
        # 目标; 根据外界传递过来的参数, 去执行真正的 git 命令
        # 删除本地标签: git tag -d 标签名
        # 删除远程标签: git push origin :标签名

        # 1. 定义一个空的命令数组
        commands = []
        # 2. 取出参数 tagName, removeLocal, removeRemote
        tagName = params[:tagName]
        removeLocal = params[:removeLocal]
        removeRemote = params[:removeRemote]        
        # 3. 如果需要删除本地标签: git tag -d 标签名 >> 追加到命令数组中
        if removeLocal
          commands << "git tag -d #{tagName}"
        end
        # 4. 如果需要删除远程标签: git push origin :标签名 >> 追加到命令数组中
        if removeRemote
          commands << "git push origin :#{tagName}"
        end
        # 5. 把数组中所有的命令 按照 && 进行拼接, 逻辑与, 前面执行不成功, 后面不会执行
        resultCommand = commands.join(" && ")
        # 6. 执行整个命令脚本
        Actions.sh(resultCommand)
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "自己定义的action, 可以删除 本地 & 远程 标签"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "你可以使用这个action, 来删除 git 的本地 & 远程标签, so cool"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :tagName,
                                       env_name: "TAGNAME", # The name of the environment variable
                                       description: "需要被删除的标签", # a short description of this parameter
                                       is_string: true, 
                                       optional: false
                                       ),
          FastlaneCore::ConfigItem.new(key: :removeLocal,
                                       env_name: "REMOVELOCAL", # The name of the environment variable
                                       description: "是否需要删除本地标签", # a short description of this parameter
                                       is_string: false, 
                                       optional: true,
                                       default_value: true
                                       ),
          FastlaneCore::ConfigItem.new(key: :removeRemote,
                                       env_name: "REMOVEREMOTE", # The name of the environment variable
                                       description: "是否需要删除远程标签", # a short description of this parameter
                                       is_string: false, 
                                       optional: true,
                                       default_value: true
                                       )
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['REMOVE_TAG_CUSTOM_VALUE', 'A description of what this value contains']
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
