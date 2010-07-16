module Zync
  class Body
    include EventMachine::Deferrable

    def call(body)
      body.each do |chunk|
        @body_callback.call(chunk)
      end
    end

    def each &blk
      @body_callback = blk
    end
  end
end
