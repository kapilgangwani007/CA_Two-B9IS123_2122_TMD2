/* 
* This class is used as a wrapper class to store the data getting from response and converting it to object.
*/
public class EventSubCategoryWrapper {
  public cls_pagination pagination;
 public List<cls_subcategories> subcategories;
 public class cls_pagination {
      public Integer object_count;    //216
      public Integer page_number;    //1
      public Integer page_size;    //50
      public Integer page_count;    //5
      public String continuation; //eyJwYWdlIjogMn0
      public Boolean has_more_items;
 }
 public class cls_subcategories {
      public String resource_uri; //https://www.eventbriteapi.com/v3/subcategories/1001/
      public String id; //1001
      public String name; //Startups & Small Business
      public String name_localized; //Startups & Small Business
      public cls_parent_category parent_category;
 }
 public class cls_parent_category {
      public String resource_uri; //https://www.eventbriteapi.com/v3/categories/101/
      public String id; //101
      public String name; //Business & Professional
      public String name_localized; //Business & Professional
      public String short_name; //Business
      public String short_name_localized; //Business
 }
}