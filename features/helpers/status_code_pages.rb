def status_code_pages(driver, src)
  js_script = <<JSS
      xhr = new XMLHttpRequest();
      xhr.open('GET',  '#{URI.encode(src.strip)}' , true);
      xhr.setRequestHeader('Cookies', "_crm_binomo_com_session=Z1pjL2FOU0pTVUg1ZUc2Z3lwZnM1SlV1ZjQ3Q1pQWTFJbnk5MnZMV1BwdWRZUGF1VCtiSzZWTEcvV2lzamxOZGlWT09HTlV2aFBzYWtGR0dTUEtOSUNNWXUvM2NLSDJPMEl1YW9QRmNOdkRRcWc4Ujl6dlQvY25pVlAyZGQ5VWNuRU9KUCtPd0tvTVAyclFzS0M4eE5iRncvRG5wM29RdTg4WUJCMW1WalM4RFhQS2duMk5EcmtCMjJXM01uY3FMLS1taGVkbDJ5Zk1nSEZkSFgvd25YRk5BPT0%3D--4348dac73f4621d58004ca274e5ba0a3606fc96a")
      xhr.setRequestHeader('Cookies', "crm_user_id=MzE%3D--e5fc5953804cefddbc38c963fea880e84941d866")
      xhr.withCredentials = true;
      xhr.send(null);
      setTimeout(function(){}, 500)
JSS

  jquery = <<JSS
   msg = '';
    if (window.jQuery) {
        msg = 'You are running jQuery version: ' + jQuery.fn.jquery;
    } else {
        msg = 'jQuery is not installed';
    }
    return msg
JSS

  driver.execute_script(js_script)
  jquery = driver.execute_script(jquery)

  retried_process(1) do
    sleep 0.5
    status = driver.execute_script('return xhr.status')
    if status == 0
      sleep 1
      return raise
    else
    end


    if status == 200 || status == 302
      print "<br><br>" + link_report_id(URI.encode(src).sub(/%0A/, ''), URI.encode(src).sub(/%0A/, '') + " => " + "<text class= 'status_green'><style type='text/css'> .status_green { color:#245; font-size:16px;} </style> #{status} #{jquery}</text>") + "<br><br><br>" if ENV['response_http'] == "true"
    else
      print "<br><br>" + link_report_id(URI.encode(src).sub(/%0A/, ''), URI.encode(src).sub(/%0A/, '') + " => " + "<text class= 'status_red'><style type='text/css'> .status_red { color:red; font-size:16px;} </style> #{status} #{jquery} </text>") + "<br><br><br>" if ENV['not_response_http'] == "true"
    end
  end
end
