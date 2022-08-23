package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.FreeBoard;
import mybatis.SqlSessionBean;

public class FreeboardDao {
	private static FreeboardDao dao = new FreeboardDao();
	private FreeboardDao() {};
	public static FreeboardDao getInstance() {
		return dao;
	}
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	public void readcountUp(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("readcountUp", idx);
		mapper.commit();
		mapper.close();
	}
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int count = mapper.selectOne("getCount");
		mapper.close();
		return count;
	}
	public List<FreeBoard> getPageList(Map<String, Integer> map){
		SqlSession mapper = factory.openSession();
		List<FreeBoard> list = mapper.selectList("getPageList", map);
		mapper.close();
		return list;
	}
	public FreeBoard getDetail(int idx){
		SqlSession mapper = factory.openSession();
		FreeBoard vo = mapper.selectOne("freeboard.detail", idx);
		mapper.close();
		return vo;
	}
	public int insert(FreeBoard vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("freeboard.insert", vo);
		// 매퍼 xml 네임스페이스. id, 다른 매퍼 파일과 id중복일 경우 네임스페이스로 식별
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public void update(FreeBoard vo) {
		SqlSession mapper= factory.openSession();
		mapper.update("freeboard.update",vo);
		mapper.commit();
		mapper.close();
	}
	
	public int delete(Map<String,Object> map) {
		SqlSession mapper= factory.openSession();
		int result= mapper.delete("freeboard.delete", map);
		mapper.commit();
		mapper.close();
		return result;
	}
}
