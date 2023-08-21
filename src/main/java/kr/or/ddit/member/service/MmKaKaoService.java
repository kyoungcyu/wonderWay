package kr.or.ddit.member.service;

import java.io.IOException;
import java.util.Map;

public interface MmKaKaoService {

	public String getToken(String code) throws IOException;

	public Map<String, Object> getUserInfo(String access_token) throws IOException;

	public String getAgreementInfo(String access_token);

}
