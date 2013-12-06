require 'oj'

module Rack

  class JsonPostParser

    # Rack Constants
    POST_BODY          = 'rack.input'.freeze
    FORM_INPUT         = 'rack.request.form_input'.freeze
    FORM_HASH          = 'rack.request.form_hash'.freeze

    DEFAULT_CONTENT_TYPE = 'application/json'

    DEFAULT_PARSE_PROC = Proc.new { |body| Oj.load body }

    def initialize(app, opts={})
      @app = app
      @parse_proc = opts[:parse] || DEFAULT_PARSE_PROC
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      content_type = Rack::Request.new(env).media_type

      if content_type == DEFAULT_CONTENT_TYPE
        body = env[POST_BODY].read
        return @app.call(env) if (body.respond_to?(:empty?) ? body.empty? : !body) # Send it down the stack immediately
        begin
          result = @parse_proc.call body
          env.update FORM_HASH => result, FORM_INPUT => env[POST_BODY]
        rescue => exc

          return [400, {'Content-Type' => DEFAULT_CONTENT_TYPE }, Hash[message:exc.message] ]
        end
      end

      @app.call env
    end

  end

end