module Representation
  module Dataset

    include Representation

    module DatasetMethods

      def as(template, opts={})
        all.map! do |item|
          item.as template, opts
        end
      end

    end

    def self.included(object)
      object.class_eval do
        dataset_module DatasetMethods
      end
    end

  end
end