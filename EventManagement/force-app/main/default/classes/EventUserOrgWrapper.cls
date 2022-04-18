/*
 * This class is used as a wrapper class to store the data getting from response from the organisaton ID and showing sending it in UI
 */
public class EventUserOrgWrapper {
	public List<cls_organizations> organizations;
	public cls_pagination pagination;

	public class cls_organizations {
		public String type;
		//organization
		public String name;
		//Kapil Gangwani
		public String vertical;
		//default
		public String parent_id;
		public String locale;
		public String image_id;
		public String id;
		//908029239533
	}

	public class cls_pagination {
		public Integer object_count;
		//1
		public String continuation;
		//AGWl1yHGbyk5eTJdL_K7a1Kk-4tyhh54JNtt9JUVaQHBPzlvFOp6NJvMyRYJbKIAOlEixhaceKnd
		public Integer page_count;
		//1
		public Integer page_size;
		//50
		public Boolean has_more_items;
		public Integer page_number;
		//1
	}
}