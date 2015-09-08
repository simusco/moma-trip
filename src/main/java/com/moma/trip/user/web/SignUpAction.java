package com.moma.trip.user.web;

import com.moma.framework.web.BaseSupportAction;
import com.moma.trip.common.po.User;
import com.moma.trip.user.service.SignUpService;

public class SignUpAction extends BaseSupportAction {

	private static final long serialVersionUID = -7767707636880122193L;

	private SignUpService signUpService;
	private String email;
	private String password;

	public String signup() {

		User user = new User();
		user.setEnable(User.Y);
		user.setName("ÐÂÓÃ»§");
		user.setLoginId(email);
		user.setPassword(password);

		try{
			signUpService.save(user);
			
			return this.success(user);
		}catch(Exception e){
			e.printStackTrace();
			
			return this.error(null, "×¢²áÊ§°Ü£¡");
		}
	}

	public SignUpService getSignUpService() {
		return signUpService;
	}

	public void setSignUpService(SignUpService signUpService) {
		this.signUpService = signUpService;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
