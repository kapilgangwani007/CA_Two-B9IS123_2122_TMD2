public class EventCreateWrapper {
	public cls_event event;

	class cls_event {
		public cls_name name;
		public cls_description description;
		public cls_start start;
		public cls_end ends;
		public String currencys;
		//USD
		public Boolean online_event;
		public String organizer_id;
		//45462715823
		public Boolean listed;
		public Boolean shareable;
		public Boolean invite_only;
		public Boolean show_remaining;
		public String password;
		//Hellofine28@
		public Integer capacity;
		//100
		public Boolean is_reserved_seating;
		public Boolean is_series;
		public Boolean show_pick_a_seat;
		public Boolean show_seatmap_thumbnail;
		public Boolean show_colors_in_seatmap_thumbnail;
		public String locale;
		//de_AT
	}

	class cls_name {
		public String html;
	}

	class cls_description {
		public String html;
	}

	class cls_start {
		public String timezone;
		public String utc;
		//2018-05-12T02:00:00Z
	}

	class cls_end {
		public String timezone;
		public String utc;
		//2018-05-12T02:00:00Z
	}
}