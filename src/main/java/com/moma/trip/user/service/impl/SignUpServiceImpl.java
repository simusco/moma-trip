package com.moma.trip.user.service.impl;

import java.util.Date;
import java.util.Random;

import com.moma.framework.utils.Md5;
import com.moma.framework.utils.UUIDUtils;
import com.moma.trip.common.po.User;
import com.moma.trip.user.mapper.SignUpMapper;
import com.moma.trip.user.service.SignUpService;

public class SignUpServiceImpl implements SignUpService {

	private SignUpMapper signUpMapper;

	public SignUpMapper getSignUpMapper() {
		return signUpMapper;
	}

	public void setSignUpMapper(SignUpMapper signUpMapper) {
		this.signUpMapper = signUpMapper;
	}

	public void save(User user) {
		String salt = Math.abs(new Random().nextLong())+"";
		String cpassword = Md5.encode(user.getPassword(), salt);

		user.setUserId(UUIDUtils.getUUID());
		user.setSalt(salt);
		user.setPassword(cpassword);
		user.setCreateTime(new Date());

		signUpMapper.saveUser(user);
	}

}
