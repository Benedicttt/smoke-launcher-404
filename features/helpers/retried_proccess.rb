  def retried_process(seconds = 5, tries = 10, finish_process = nil)
      @tries ||= tries
      yield
    rescue
      print  "\u2713"
      sleep(seconds) && retry if (@tries -= 1) > 0
      @tries = tries
      finish_process.is_a?(Proc) ? finish_process.call : raise
  end
