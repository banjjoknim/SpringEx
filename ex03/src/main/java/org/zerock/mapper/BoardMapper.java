package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	//@Select("SELECT * FROM tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board); //데이터를 수정해야 하므로 데이터 자체를 넘겨줌.
	
	public int getTotalCount(Criteria cri);
	
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}

