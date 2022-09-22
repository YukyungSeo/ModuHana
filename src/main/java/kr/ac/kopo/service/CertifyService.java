package kr.ac.kopo.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:coolsms.properties")
public class CertifyService {

	private final MemberDAO memberDAO;
	private final AccountDAO accountDAO;

	public Map<String, String> cerificationWithIdCard(String file) {
//		StringBuffer response = OCRGeneralAPI(file);
		String response = "{\"version\":\"V2\",\"requestId\":\"ee26a4b8-2784-4ab9-975d-cbec2c893439\",\"timestamp\":1661389995506,\"images\":[{\"uid\":\"76bffb8a9b944001acc16bfd1913ca1b\",\"name\":\"demo\",\"inferResult\":\"SUCCESS\",\"message\":\"SUCCESS\",\"validationResult\":{\"result\":\"NO_REQUESTED\"},\"convertedImageInfo\":{\"width\":4032,\"height\":3024,\"pageIndex\":0,\"longImage\":false},\"fields\":[{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":703.0,\"y\":728.0},{\"x\":1914.0,\"y\":710.0},{\"x\":1918.0,\"y\":953.0},{\"x\":707.0,\"y\":971.0}]},\"inferText\":\"주민등록증\",\"inferConfidence\":0.9971,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":671.0,\"y\":1091.0},{\"x\":1832.0,\"y\":1077.0},{\"x\":1834.0,\"y\":1280.0},{\"x\":674.0,\"y\":1294.0}]},\"inferText\":\"서유경()\",\"inferConfidence\":0.8659,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":615.0,\"y\":1380.0},{\"x\":1893.0,\"y\":1375.0},{\"x\":1894.0,\"y\":1500.0},{\"x\":616.0,\"y\":1505.0}]},\"inferText\":\"960308-1111111\",\"inferConfidence\":0.9953,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":536.0,\"y\":1634.0},{\"x\":1008.0,\"y\":1634.0},{\"x\":1008.0,\"y\":1778.0},{\"x\":536.0,\"y\":1778.0}]},\"inferText\":\"경상남도\",\"inferConfidence\":1.0,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1037.0,\"y\":1631.0},{\"x\":1404.0,\"y\":1631.0},{\"x\":1404.0,\"y\":1782.0},{\"x\":1037.0,\"y\":1782.0}]},\"inferText\":\"사천시\",\"inferConfidence\":1.0,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1443.0,\"y\":1631.0},{\"x\":1987.0,\"y\":1626.0},{\"x\":1988.0,\"y\":1771.0},{\"x\":1444.0,\"y\":1776.0}]},\"inferText\":\"새동네1길\",\"inferConfidence\":0.9997,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":2023.0,\"y\":1645.0},{\"x\":2117.0,\"y\":1645.0},{\"x\":2117.0,\"y\":1757.0},{\"x\":2023.0,\"y\":1757.0}]},\"inferText\":\"6\",\"inferConfidence\":0.9995,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":536.0,\"y\":1778.0},{\"x\":644.0,\"y\":1778.0},{\"x\":644.0,\"y\":1894.0},{\"x\":536.0,\"y\":1894.0}]},\"inferText\":\"1.\",\"inferConfidence\":0.951,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":677.0,\"y\":1771.0},{\"x\":1004.0,\"y\":1771.0},{\"x\":1004.0,\"y\":1904.0},{\"x\":677.0,\"y\":1904.0}]},\"inferText\":\"101동\",\"inferConfidence\":0.9997,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1033.0,\"y\":1771.0},{\"x\":1390.0,\"y\":1771.0},{\"x\":1390.0,\"y\":1894.0},{\"x\":1033.0,\"y\":1894.0}]},\"inferText\":\"602호\",\"inferConfidence\":0.9998,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1418.0,\"y\":1757.0},{\"x\":1876.0,\"y\":1757.0},{\"x\":1876.0,\"y\":1908.0},{\"x\":1418.0,\"y\":1908.0}]},\"inferText\":\"(선구동,\",\"inferConfidence\":0.9977,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1922.0,\"y\":1753.0},{\"x\":2171.0,\"y\":1753.0},{\"x\":2171.0,\"y\":1904.0},{\"x\":1922.0,\"y\":1904.0}]},\"inferText\":\"비룡\",\"inferConfidence\":0.9998,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":540.0,\"y\":1886.0},{\"x\":1062.0,\"y\":1886.0},{\"x\":1062.0,\"y\":2030.0},{\"x\":540.0,\"y\":2030.0}]},\"inferText\":\"각산타운)\",\"inferConfidence\":0.9987,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1696.0,\"y\":2139.0},{\"x\":2032.0,\"y\":2146.0},{\"x\":2030.0,\"y\":2263.0},{\"x\":1694.0,\"y\":2257.0}]},\"inferText\":\"2013.\",\"inferConfidence\":0.9953,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":2056.0,\"y\":2146.0},{\"x\":2192.0,\"y\":2146.0},{\"x\":2192.0,\"y\":2257.0},{\"x\":2056.0,\"y\":2257.0}]},\"inferText\":\"6.\",\"inferConfidence\":0.9999,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":2228.0,\"y\":2146.0},{\"x\":2434.0,\"y\":2146.0},{\"x\":2434.0,\"y\":2257.0},{\"x\":2228.0,\"y\":2257.0}]},\"inferText\":\"25.\",\"inferConfidence\":0.9994,\"type\":\"NORMAL\",\"lineBreak\":true},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1343.0,\"y\":2297.0},{\"x\":1904.0,\"y\":2297.0},{\"x\":1904.0,\"y\":2455.0},{\"x\":1343.0,\"y\":2455.0}]},\"inferText\":\"경상남도\",\"inferConfidence\":1.0,\"type\":\"NORMAL\",\"lineBreak\":false},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":1955.0,\"y\":2297.0},{\"x\":2534.0,\"y\":2297.0},{\"x\":2534.0,\"y\":2459.0},{\"x\":1955.0,\"y\":2459.0}]},\"inferText\":\"사천시장\",\"inferConfidence\":1.0,\"type\":\"NORMAL\",\"lineBreak\":true}]}]}\r\n";
//		System.out.println(response);

		JSONObject jObject = new JSONObject(response);

		JSONArray imagesArr = jObject.getJSONArray("images");

		JSONObject images = imagesArr.getJSONObject(0);
		String inferResult = images.getString("inferResult");

		Map<String, String> map = new HashMap<>();

		if (inferResult.equals("SUCCESS")) {
			JSONArray fields = images.getJSONArray("fields");

			JSONObject typeObj = fields.getJSONObject(0);
			String type = typeObj.getString("inferText");

			if (type.equals("주민등록증")) {

				JSONObject field = fields.getJSONObject(1);
				String name = field.getString("inferText");
				name = name.substring(0, name.length() - 2);
				map.put("name", name);

				field = fields.getJSONObject(2);
				String regNo = field.getString("inferText");
				String[] regNoSplit = regNo.split("-");
				map.put("regNoFront", regNoSplit[0]);
				map.put("regNoBack", regNoSplit[1]);

				field = fields.getJSONObject(fields.length() - 5);
				String year = field.getString("inferText");
				year = year.substring(0, 4);
				map.put("year", year);

				field = fields.getJSONObject(fields.length() - 4);
				String month = field.getString("inferText");
				month = month.substring(0, month.length() - 1);
				map.put("month", month);

				field = fields.getJSONObject(fields.length() - 3);
				String day = field.getString("inferText");
				day = day.substring(0, 2);
				map.put("day", day);

				System.out.println(name + " " + regNo + " " + year + " " + month + " " + day);
			}
		}

		return map;
	}

	@SuppressWarnings("unused")
	private StringBuffer OCRGeneralAPI(String imgFile) {
		String apiURL = "https://0to11bhce4.apigw.ntruss.com/custom/v1/17894/7f29e4995c4711d94706c2f1f04f02cee7635733e0ce11a0a985f7f3221af2ca/general";
		String secretKey = "WkdVaFVJQmRKc1NLTXNFUkV2SVF6S3NCYkd2YkhHdnA=";
		String imageFile = imgFile;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			return response;
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

	public AccountVO createDepositAccount(MemberVO user, String password) {
		// 유저의 자세한 정보 가져오기
		MemberVO memberVO = memberDAO.selectAllINfoById(user.getId());
		// account 정보 채우기
		AccountVO accountVO = new AccountVO();
		accountVO.setPassword(password);
		accountVO.setMemberId(user.getId());
		accountVO.setName(user.getName() + "님의 예치금 계좌");
		accountVO.setTypeCode("02"); // 02는 예치금 계좌

		// api request 보내기
		String url = "http://localhost:9990/HanaBank/account/create/member";

		JSONObject param = new JSONObject();
		param.put("user", new JSONObject(memberVO));
		param.put("account", new JSONObject(accountVO));
		
		JSONObject jsonObject = HttpUtil.callApi(url, param, "POST");

		// JSONOject 파싱
		Gson gson = new Gson();
		AccountVO newAccount = gson.fromJson(jsonObject.toString(), AccountVO.class);
		newAccount.setMemberId(user.getId());
		
		// newAccount 저장
		accountDAO.insert(newAccount);
		
		return newAccount;
	}
	
}
