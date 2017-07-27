                #        partner_api GET    /partner_api/bets/:date(.:format)             partner_api/stats#bets
                #                    GET    /partner_api/registrations/:from_id(.:format) partner_api/stats#registrations
                #                    GET    /partner_api/money/:date(.:format)            partner_api/stats#money
                #   partner_api_ftds GET    /partner_api/ftds(.:format)                   partner_api/stats#ftds
                #  partner_api_rates GET    /partner_api/rates(.:format)                  partner_api/stats#rates
                #           api_root GET    /api(.:format)                                api/home#index
                #     api_currencies GET    /api/currencies(.:format)                     api/home#currencies
                    #  api_countries GET    /api/countries(.:format)                      api/home#countries
                        # api_cities GET    /api/cities(.:format)                         api/cities#index
                          # api_time GET    /api/time(.:format)                           api/home#time
                      #  api_locales GET    /api/locales(.:format)                        api/home#locales
                        # api_config GET    /api/config(.:format)                         api/home#web_config
                           api_faq GET    /api/faq(.:format)                            api/home#faq
                      #  api_sign_in POST   /api/sign_in(.:format)                        api/sessions#create
                      api_sign_out GET    /api/sign_out(.:format)                       api/sessions#destroy
                       api_sign_up POST   /api/sign_up(.:format)                        api/user#create
                 api_quotes_values GET    /api/quotes/values(.:format)                  api/quotes#values
                api_quotes_quarter GET    /api/quotes/quarter(.:format)                 api/quotes#quarter
                       api_profile GET    /api/profile(.:format)                        api/user#profile
                  api_profile_edit POST   /api/profile/edit(.:format)                   api/user#update
                                   GET    /api/profile/edit(.:format)                   api/user#update
       api_profile_change_password GET    /api/profile/change_password(.:format)        api/user#change_password
                                   POST   /api/profile/change_password(.:format)        api/user#change_password
              api_profile_tutorial GET    /api/profile/tutorial(.:format)               api/user#tutorial
            api_profile_agree_risk GET    /api/profile/agree_risk(.:format)             api/user#agree_risk
                api_profile_avatar POST   /api/profile/avatar(.:format)                 api/user#avatar
                 api_activate_real GET    /api/activate_real(.:format)                  api/user#activate_real
                 api_activate_demo GET    /api/activate_demo(.:format)                  api/user#activate_demo
                api_toggle_hotkeys GET    /api/toggle_hotkeys(.:format)                 api/user#toggle_hotkeys
            api_reset_demo_balance GET    /api/reset_demo_balance(.:format)             api/user#reset_demo_balance
                          api_page GET    /api/page(.:format)                           api/page#index
                               api GET    /api/page/:page(.:format)                     api/page#show
               api_password_remind GET    /api/password/remind(.:format)                api/password#remind
               api_password_change GET    /api/password/change(.:format)                api/password#change
                                   POST   /api/password/change(.:format)                api/password#change
                    api_email_send GET    /api/email/send(.:format)                     api/user#send_activation_email
                api_email_activate GET    /api/email/activate(.:format)                 api/user#activate
                api_cashier_payout GET    /api/cashier/payout(.:format)                 api/cashier#payout
               api_cashier_payment GET    /api/cashier/payment(.:format)                api/cashier#payment
                        api_assets GET    /api/assets(.:format)                         api/assets#index
                  api_assets_types GET    /api/assets/types(.:format)                   api/assets#types
                         api_deals GET    /api/deals(.:format)                          api/deals#index
                  api_deals_create GET    /api/deals/create(.:format)                   api/deals#create
                    api_deals_list GET    /api/deals/list(.:format)                     api/deals#list
                                   GET    /api/deals/confirm/:id(.:format)              api/deals#confirm
           api_deals_check_captcha GET    /api/deals/check_captcha(.:format)            api/deals#check_captcha
                       api_tickets GET    /api/tickets(.:format)                        api/tickets#index
                api_tickets_create POST   /api/tickets/create(.:format)                 api/tickets#create
               api_tickets_message POST   /api/tickets/message(.:format)                api/tickets#message
                  api_tickets_show GET    /api/tickets/show(.:format)                   api/tickets#show
                 api_tickets_close GET    /api/tickets/close(.:format)                  api/tickets#close
            api_tickets_categories GET    /api/tickets/categories(.:format)             api/tickets#categories
              api_tickets_statuses GET    /api/tickets/statuses(.:format)               api/tickets#statuses
                      api_feedback POST   /api/feedback(.:format)                       api/feedback#create
                      api_payments POST   /api/payments(.:format)                       api/payments#create
               api_payments_cancel POST   /api/payments/cancel(.:format)                api/payments#cancel
                                   POST   /api/tournaments/:id/participate(.:format)    api/tournaments#participate
                  api_translations GET    /api/translations(.:format)                   api/home#translations
                           api_sms POST   /api/sms(.:format)                            api/sms#status
         last_demo_api_tournaments GET    /api/tournaments/last_demo(.:format)          api/tournaments#last_demo
              list_api_tournaments GET    /api/tournaments/list(.:format)               api/tournaments#list
                   api_tournaments GET    /api/tournaments(.:format)                    api/tournaments#index
                    api_tournament GET    /api/tournaments/:id(.:format)                api/tournaments#show
                   list_api_offers GET    /api/offers/list(.:format)                    api/offers#list
                        api_offers GET    /api/offers(.:format)                         api/offers#index
                         api_offer GET    /api/offers/:id(.:format)                     api/offers#show
                       api_payouts POST   /api/payouts(.:format)                        api/payouts#create
                        api_payout DELETE /api/payouts/:id(.:format)                    api/payouts#destroy
               events_api_webinars GET    /api/webinars/events(.:format)                api/webinars#events
                      api_webinars POST   /api/webinars(.:format)                       api/webinars#create
                       api_webinar DELETE /api/webinars/:id(.:format)                   api/webinars#destroy
              api_coupons_activate GET    /api/coupons/activate(.:format)               api/coupons#activate
                 api_coupons_check GET    /api/coupons/check(.:format)                  api/coupons#check
      api_coupons_activate_instant GET    /api/coupons/activate_instant(.:format)       api/coupons#activate_instant
       api_coupons_decline_instant GET    /api/coupons/decline_instant(.:format)        api/coupons#decline_instant
                 api_notifications GET    /api/notifications(.:format)                  api/notifications#index
                  api_notification DELETE /api/notifications/:id(.:format)              api/notifications#destroy
  subscribe_api_push_subscriptions POST   /api/push_subscriptions/subscribe(.:format)   api/push_subscriptions#create
unsubscribe_api_push_subscriptions POST   /api/push_subscriptions/unsubscribe(.:format) api/push_subscriptions#unsubscribe
            api_push_subscriptions POST   /api/push_subscriptions(.:format)             api/push_subscriptions#create
                    api_v2_sign_up POST   /api/v2/sign_up(.:format)                     api/v2/user#create
          api_v2_free_deals_cancel GET    /api/v2/free_deals/cancel(.:format)           api/v2/free_deals#cancel
              api_v2_app_installed POST   /api/v2/app/installed(.:format)               api/v2/app#installed
        api_v2_free_deals_activate GET    /api/v2/free_deals/activate(.:format)         api/v2/free_deals#activate
                                   GET    /api/v2/free_deals/cancel(.:format)           api/v2/free_deals#cancel
         api_v2_free_deals_decline GET    /api/v2/free_deals/decline(.:format)          api/v2/free_deals#decline
          api_v2_free_deals_repeat GET    /api/v2/free_deals/repeat(.:format)           api/v2/free_deals#repeat
           api_v2_free_deals_close GET    /api/v2/free_deals/close(.:format)            api/v2/free_deals#close
               verify_api_v2_phone GET    /api/v2/phone/verify(.:format)                api/v2/phone#verify
               resend_api_v2_phone GET    /api/v2/phone/resend(.:format)                api/v2/phone#resend
                      api_v2_phone PATCH  /api/v2/phone(.:format)                       api/v2/phone#update
                                   PUT    /api/v2/phone(.:format)                       api/v2/phone#update
               verify_api_v2_email GET    /api/v2/email/verify(.:format)                api/v2/email#verify
      verify_by_token_api_v2_email GET    /api/v2/email/verify_by_token(.:format)       api/v2/email#verify_by_token
               resend_api_v2_email GET    /api/v2/email/resend(.:format)                api/v2/email#resend
          unsubscribe_api_v2_email GET    /api/v2/email/unsubscribe(.:format)           api/v2/email#unsubscribe
            subscribe_api_v2_email GET    /api/v2/email/subscribe(.:format)             api/v2/email#subscribe
                      api_v2_email PATCH  /api/v2/email(.:format)                       api/v2/email#update
                                   PUT    /api/v2/email(.:format)                       api/v2/email#update
            api_server_user_create POST   /api/server/user/create(.:format)             api/server/user#create
                             promo GET    (/:locale)/promo/:landing(.:format)           promo#index {:device=>"web", :locale=>/en|ru|id|ms|es|th|vn|cn|pt/}
                                          (/:locale)/*path(.:format)                    web#not_found {:device=>"web", :locale=>/en|ru|id|ms|es|th|vn|cn|pt/}
