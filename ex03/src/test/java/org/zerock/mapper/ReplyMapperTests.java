package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class })
public class ReplyMapperTests {

	private Long[] bnoArr = {201L, 202L, 203L, 204L};
	
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.range(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		
		Long targetRno = 2L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		
		Long targetRno = 3L;
		
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		
		Long targetRno = 2L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update reply");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
		
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		//2번 댓글
		// 2L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[1]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(1, 5);
		
		//202L
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 202L);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	
}
