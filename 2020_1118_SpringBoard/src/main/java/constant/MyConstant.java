package constant;

public class MyConstant {
	
	//게시판
	public static class Board{		//static은 그냥 MyConstant로 불러올 수 있음. new안해도
		
		//1Page당 보여줄 게시물 수
		public static final int BLOCK_LIST = 5;
		//1화면에 보여줄 페이지 수
		public static final int BLOCK_PAGE = 3;
	}
	
	//QNA
	public static class QnA{		
			
		//1Page당 보여줄 게시물 수
		public static final int BLOCK_LIST = 3;
		//1화면에 보여줄 페이지 수
		public static final int BLOCK_PAGE = 3;
	}
	
	//위의 카테고리별로 리스트를 다르게 줄 수 있기 때문에 public static으로 만듦.
}
