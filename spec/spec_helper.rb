require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

require 'dm-tags'
require 'dm-migrations'
require 'dm-validations'

DataMapper::Spec.setup

Spec::Runner.configure do |config|

  config.extend(DataMapper::Spec::Adapters::Helpers)

  config.before do
    Object.send(:remove_const, :TaggedModel) if defined?(TaggedModel)
    class ::TaggedModel
      include DataMapper::Resource

      property :id, Serial

      has_tags_on :skills, :interests, :tags
    end

    Object.send(:remove_const, :AnotherTaggedModel) if defined?(AnotherTaggedModel)
    class ::AnotherTaggedModel
      include DataMapper::Resource

      property :id, Serial

      has_tags_on :skills, :pets
    end

    Object.send(:remove_const, :DefaultTaggedModel) if defined?(DefaultTaggedModel)
    class ::DefaultTaggedModel
      include DataMapper::Resource

      property :id, Serial

      has_tags
    end

    Object.send(:remove_const, :UntaggedModel) if defined?(UntaggedModel)
    class ::UntaggedModel
      include DataMapper::Resource

      property :id, Serial
    end

    DataMapper.auto_migrate!
  end

end
