package kr.co.sist.util;

public class MyUtil {

	/**
	 * 라디오 버튼을 생성하는 method <br>
	 * 사용법 ) createRadio("라디오이름", 라디오 인덱스, 생성할 개수, checked를 설정할 라디오 번호)
	 * 
	 */
	

	/**
	 *  이 method는 &lt;input type="radio"를 사용자 원하는 개수로 만드는 일을 한다. <br>
	 *  사용법)
	 *  MyUtil.createRadio(String name, int radioInd, int cnt, int flagNum)
	 * @param name 라디오 버튼의 이름
	 * @param radioInd 라디오 버튼의 인덱스
	 * @param cnt 생성할 라디오 버튼의 개수
	 * @param flagNum checked 할 라디오의 순서
	 * @return 이쁘게 생성된 html Form Control
	 */
	public static String createRadio(String name, int radioInd, int cnt, int flagNum) {

		if (cnt > 100) {
			cnt = 100;
		} // end if

		if (flagNum < 0 || cnt < flagNum) {
			flagNum = 0;
		} // end if

		StringBuilder sbTemp = new StringBuilder();

		for (int i = 0; i < cnt + 1; i++) {
			sbTemp.append("<input type='radio' name='").append(name).append("_").append(radioInd).append("'")
					.append(i == flagNum ? " checked='checked'" : "").append(">").append(i).append(" ");
		} // end for

		return sbTemp.toString();
	}// createRadio

}//class
