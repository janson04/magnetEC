package service;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dao.UsersDao;

@Path("/")
public class UsersService {
	
	@POST
    @Path("/checkUsersId")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String CheckUserId(@FormParam("users_id") String users_id) {
		boolean IsUsersid = false;
		if (users_id != null) {
			IsUsersid= new UsersDao().queryIsUserId(users_id);
		}
        System.out.println("users_id: "+users_id+"\tCheck: "+IsUsersid);
        return String.valueOf(IsUsersid);
    }
	
	@POST
    @Path("/login.do")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String Login(@FormParam("users_id") String users_id) {
		boolean IsUsersid = false;
		if (users_id != null) {
			IsUsersid= new UsersDao().queryIsUserId(users_id);
		}
        System.out.println("users_id: "+users_id+"\tCheck: "+IsUsersid);
        return String.valueOf(IsUsersid);
    }
}
