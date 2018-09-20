module Fastlane
  module Actions
    module SharedValues
      REMOVE_TAG_CUSTOM_VALUE = :REMOVE_TAG_CUSTOM_VALUE
    end

    class RemoveTagAction < Action
      def self.run(params)
        # 运行该action最终需要执行的代码, 在这里写
        tagName = params[:tag]
        isRemoveLocalTag = params[:rL]
        isRemoveRemoteTag = params[:rR]
        
        # 1. 先定义一个数组, 用来存储所有需要执行的命令
        cmds = []
        
        # 2. 往数组里面, 添加相应的命令
        # 删除本地标签
        # git tag -d 标签名称
        if isRemoveLocalTag
          cmds << "git tag -d #{tagName} "
        end
      
        # 删除远程标签
        # git push origin :标签名称
        if isRemoveRemoteTag
          cmds << " git push origin :#{tagName}"
        end

        #3. 执行数组里面的所有命令
        result = Actions.sh(cmds.join('&'));
        return result
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        # 间断的说明该Action的作用是什么, 不超过80个字符
        "删除标签"
      end

      def self.details
        # 详细的描述当前的Action
        "使用该action, 可删除本地或远程标签"
      end

      def self.available_options
        # 该action需要的参数, 使用同构数组进行分割的, 可以根据每一个参数, 确定其作用
        [
          # key: 参数名称, description: 参数描述或作用, optional: 是否是可选, is_string: 是否是string类型, default_value: 默认值, verify_block: 验证的block
          FastlaneCore::ConfigItem.new(key: :tag,
                                             description: "需要被删除的标签名称",
                                             optional: false,
                                             is_string: true),
          FastlaneCore::ConfigItem.new(key: :rL,
                                       description: "是否需要删除本地标签",
                                       optional: true,
                                       is_string: false,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :rR,
                                       description: "是否需要删除远程标签",
                                       optional: true,
                                       is_string: false,
                                       default_value: true)
        ]
      end

      def self.output
        # 表示输出的内容
      end

      def self.return_value
        
        # 返回值
        nil
      end

      def self.authors
        # 作者
        ["CoderTitan"]
      end

      def self.is_supported?(platform)
        # 支持的平台
        platform == :ios
      end
    end
  end
end
