  def retried_process(seconds = 5, tries = 100, finish_process = nil)
      @tries ||= tries
      yield
    rescue
      sleep(seconds) && retry if (@tries -= 1) > 0
      @tries = tries
      finish_process.is_a?(Proc) ? finish_process.call : raise
  end
