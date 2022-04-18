/* 
* This class is used as a wrapper class to store the data getting from response and performing logic to show it in UI.
*/
public class EventWrapper{
 public String id; //12345
 public cls_name name;
 public cls_description description;
 public cls_start start;
 public cls_end ends;
     public String summary;
     public String venue_id; //80535429
 public String url; //https://www.eventbrite.com/e/45263283700
 public String vanity_url; //https://testevent.eventbrite.com
 public String created; //2017-02-19T20:28:14Z
 public String changed; //2017-02-19T20:28:14Z
 public String published; //2017-02-19T20:28:14Z
 public String status; //live
 public String currencys; //USD
 public Boolean online_event;
 public String organization_id; //
 public String organizer_id; //
 public cls_organizer organizer;
 public Integer logo_id;
 public cls_logo logo;
 public cls_venue venue;
 public String format_id;
 public cls_format format;
 public cls_category category;
 public cls_subcategory subcategory;
 public cls_music_properties music_properties;
 public cls_bookmark_info bookmark_info;
 public cls_ticket_availability ticket_availability;
 public Boolean listed;
 public Boolean shareable;
 public Boolean invite_only;
 public Boolean show_remaining;
 public String password; //12345
 public Integer capacity;    //100
 public Boolean capacity_is_custom;
 public String tx_time_limit; //12345
 public Boolean hide_start_date;
 public Boolean hide_ends_date;
 public String locale; //en_US
 public Boolean is_locked;
 public String privacy_setting; //unlocked
 public Boolean is_externally_ticketed;
 public cls_external_ticketing external_ticketing;
 public Boolean is_series;
 public Boolean is_series_parent;
 public String series_id; //56321
 public Boolean is_reserved_seating;
 public Boolean show_pick_a_seat;
 public Boolean show_seatmap_thumbnail;
 public Boolean show_colors_in_seatmap_thumbnail;
 public Boolean is_free;
 public String source; //api
 public String version; //null
 public String resource_uri; //https://www.eventbriteapi.com/v3/events/1234/
 public cls_event_sales_status event_sales_status;
 public cls_checkout_settings checkout_settings;
public class cls_name {
      public String text; //Some text
      public String html; //<p>Some text</p> 
 }
public class cls_description {
      public String text; //Some text
      public String html; //<p>Some text</p>
 }
 public class cls_ticket_availability {
      public Boolean has_available_tickets;
      public cls_minimum_ticket_price minimum_ticket_price;
      public cls_maximum_ticket_price maximum_ticket_price;
      public Boolean is_sold_out;
      public cls_start_sales_date start_sales_date;
      public Boolean waitlist_available;
 }
public class cls_minimum_ticket_price {
      public String currencys; //USD
      public Integer value;    //432
      public String major_value; //4.32
      public String display; //4.32 USD
 }
public class cls_maximum_ticket_price {
      public String currencys; //USD
      public Integer value;    //432
      public String major_value; //4.32
      public String display; //4.32 USD
 }
public class cls_start_sales_date {
      public String timezone; //America/Los_Angeles
      public String utc; //2018-05-12T02:00:00Z
      public String local; //2018-05-11T19:00:00
 }
public class cls_external_ticketing {
      public String external_url; //
      public String ticketing_provider_name; //
      public Boolean is_free;
      public cls_minimum_ticket_price minimum_ticket_price;
      public cls_maximum_ticket_price maximum_ticket_price;
      public String sales_start; //
      public String sales_ends; //
 }
 public class cls_event_sales_status {
      public String sales_status; //text
      public cls_start_sales_date start_sales_date;
 }
public class cls_checkout_settings {
      public String created; //2018-01-31T13:00:00Z
      public String changed; //2018-01-31T13:00:00Z
      public String country_code; //
      public String currencys_code; //
      public String checkout_method; //paypal
      public List<cls_offline_settings> offline_settings;
      public String user_instrument_vault_id; //
 }
 public class cls_offline_settings {
      public String payment_method; //CASH
      public String instructions; //
 }
public class cls_start {
      public String timezone; //America/Los_Angeles
      public String utc; //2018-05-12T02:00:00Z
      public String local; //2018-05-11T19:00:00
 }
public class cls_end {
      public String timezone; //America/Los_Angeles
      public String utc; //2018-05-12T02:00:00Z
      public String local; //2018-05-11T19:00:00
 }
public class cls_organizer {
      public String name; //
      public cls_description description;
      public cls_long_description long_description;
      public String logo_id;
      public cls_logo logo;
      public String resource_uri; //https://www.eventbriteapi.com/v3/organizers/12345/
      public String id; //12345
      public String url; //https://www.eventbrite.com/o/12345/
      public Integer num_past_events;    //5
      public Integer num_future_events;    //1
      public String twitter; //@abc
      public String facebook; //abc
 }
public class cls_long_description {
      public String text; //Some text
      public String html; //<p>Some text</p>
 }
}
