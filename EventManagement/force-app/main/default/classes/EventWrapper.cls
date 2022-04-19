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

public class cls_logo {
      public String id; //12345
      public String url; //https://image.com
      public cls_crop_mask crop_mask;
      public cls_original original;
      public String aspect_ratio; //2
      public String edge_color; //#6a7c8b
      public Boolean edge_color_set;
 }
public class cls_crop_mask {
      public cls_top_left top_left;
      public Integer width;    //15
      public Integer height;    //15
 }
public class cls_top_left {
      public Integer y;    //15
      public Integer x;    //15
 }
public class cls_original {
      public String url; //https://image.com
      public Integer width;    //800
      public Integer height;    //400
 }
public class cls_venue {
      public String name; //Great Venue
      public String age_restriction;
      public Integer capacity;    //100
      public cls_address address;
      public String resource_uri; //https://www.eventbriteapi.com/v3/venues/3003/
      public String id; //3003
      public String latitude; //49.28497549999999
      public String longitude; //123.11082529999999
 }

public class cls_address {
      public String address_1;
      public String address_2;
      public String city;
      public String region;
      public String postal_code;
      public String country;
      public Double latitude;
      public Double longitude;
 }


public class cls_format {
      public String id; //2
      public String name; //Seminar or Talk
      public String name_localized; //Seminar or Talk
      public String short_name; //Seminar
      public String short_name_localized; //Seminar
      public String resource_uri; //https://www.eventbriteapi.com/v3/formats/2/
 }
public class cls_category {
      public String id; //103
      public String resource_uri; //https://www.eventbriteapi.com/v3/categories/103/
      public String name; //Music
      public String name_localized; //Music
      public String short_name; //Music
      public String short_name_localized; //Music
      public List<cls_subcategories> subcategories;
 }
public class cls_subcategories {
 }
public class cls_parent_category {
      public String id; //103
      public String resource_uri; //https://www.eventbriteapi.com/v3/categories/103/
      public String name; //Music
      public String name_localized; //Music
      public String short_name; //Music
      public String short_name_localized; //Music
      public List<cls_subcategories> subcategories;
 }
public class cls_subcategory {
      public String id; //3003
      public String resource_uri; //https://www.eventbriteapi.com/v3/subcategories/3003/
      public String name; //Classical
      public cls_parent_category parent_category;
 }
public class cls_music_properties {
      public String age_restriction;
      public String presented_by;
      public String door_time; //2019-05-12T-19:00:00Z
 }

public class cls_bookmark_info {
      public Boolean bookmarked;
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
}
