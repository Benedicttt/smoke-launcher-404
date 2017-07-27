def close_active_window
 DRIVER.switch_to.window(DRIVER.window_handles.last)
 DRIVER.switch_to.window_handles[0]
end
