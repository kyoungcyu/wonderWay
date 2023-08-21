package kr.or.ddit;

public class TEST {

	/**
	 * java hello
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("java hello!!");
//		drawStarPattern1(5); // 별 모양 패턴 1 출력
		int rows = 5;
		 for (int i = 1; i <= rows; i++) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("* ");
	            }
	            System.out.println();
		 }
	            
        
	}
	 public static void drawStarPattern1(int rows) {
	        for (int i = 1; i <= rows; i++) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("* ");
	            }
	            System.out.println();
	        }
	    }

	
}
