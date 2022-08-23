package board.vo;




import lombok.Getter;

@Getter
public class PageVo {
	private int currentPage;		//현재 페이지
	private int totalCount;			//글의 전체 갯수. dao에 메소드 작성했음.
	private int pageSize;			//한개페이지에 보여줄 글 갯수
	
	private int totalPage;			//전체 페이지 갯수
	private int startPage;
	private int endPage;			//꼭 필요하지 않습니다. startPage~endPage로 페이지 목록 만듦
	
	private int startNo;
	private int endNo;
	public PageVo(int currentPage, int totalCount, int pageSize) {   //외부(비지니스로직)에서 결정하고 전달되는값.
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		
		//totalCount = 367개, pageSize=20, totalPage =19
		//totalCount = 7개, pageSize=20, totalPage =1
		//totalCount = 200개, pageSize=20, totalPage =10
		totalPage = (int)Math.ceil((double)totalCount/pageSize);		//(totalCount-1)/pageSize + 1;
		//현재페이지 범위(1~totalPage) 의 유효성을 체크 
		this.currentPage= (currentPage < 1)? 1:currentPage;
		this.currentPage= (currentPage > totalPage)? totalPage:this.currentPage;
		
		//mysql 의 limit 사용할 때
		startNo=(this.currentPage-1)*pageSize+1;
		endNo= startNo+(pageSize-1);
		startPage = (this.currentPage-1)/10*10+1;		 //페이지번호 리스트 10개씩 
		//현재 페이지가 57 , startPage =51
		//현재 페이지가 7 , startPage =1
		//현재 페이지가 156 , startPage =151
		//현재 페이지가 160 , startPage =151
		endPage = startPage+9;
		endPage= (endPage > totalPage) ? totalPage:endPage;
	}
}



