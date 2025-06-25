package org.spring.example.review;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

    @Autowired
     ReviewBoardDao reviewBoardDao;
    @Autowired
    ReviewReplyDao reviewReplyDao;
    @Autowired
    private SqlSessionTemplate session;

    @Override
    public int getCount() throws Exception {
        System.out.println("DEBUG: Service.getCount() called."); // 디버그 로그 추가
        return reviewBoardDao.count();
    }

    @Override
    public int remove(Long id, Long userId) throws Exception{
        System.out.println("DEBUG: Service.remove() called for reviewId: " + id + ", userId: " + userId); // 디버그 로그 추가
        return reviewBoardDao.delete(id,userId);
    }
    @Override
    public int write(ReviewBoardDto reviewBoardDto) throws Exception{
        System.out.println("DEBUG: Service.write() called for review: " + reviewBoardDto.getReviewId()); // 디버그 로그 추가
        return reviewBoardDao.insert(reviewBoardDto);
    }

    @Override
    public ReviewBoardDto read(Long id) throws Exception{
        System.out.println("DEBUG: Service.read() called for reviewId: " + id); // 디버그 로그 추가
        return reviewBoardDao.select(id);
    }


    @Override
    public List<ReviewBoardDto> getPage(Map map) throws Exception {
        // 이 부분이 가장 중요합니다.
        System.out.println("DEBUG: Service.getPage called with map: " + map);
        List<ReviewBoardDto> reviews = reviewBoardDao.selectPage(map);
        System.out.println("DEBUG: Service.getPage - DAO.selectPage returned " + (reviews != null ? reviews.size() : "null") + " reviews.");
        return reviews;
    }

    @Override
    public int modify(ReviewBoardDto reviewBoardDto) throws Exception{
        System.out.println("DEBUG: Service.modify() called for reviewId: " + reviewBoardDto.getReviewId()); // 디버그 로그 추가
        return reviewBoardDao.update(reviewBoardDto);
    }
    @Override
    public List<ReviewBoardDto> getAll() throws Exception {
        System.out.println("DEBUG: Service.getAll() called."); // 디버그 로그 추가
        List<ReviewBoardDto> reviews = reviewBoardDao.selectAll(); // selectAll 호출
        System.out.println("DEBUG: Service.getAll - DAO.selectAll returned " + (reviews != null ? reviews.size() : "null") + " reviews.");

        // 리뷰별 답변을 가져오는 로직 (이 부분은 정상 작동한다면 괜찮습니다.)
        if (reviews != null) {
            for (ReviewBoardDto review : reviews) {
                // reviewReplyDao.selectAll(review.getReviewId())를 호출하여 답변을 가져옵니다.
                // 이 메서드의 이름은 reviewReplyDao에 맞게 확인해주세요.
                // 예를 들어 ReviewReplyDao에 List<ReviewReplyDto> selectAllRepliesByReviewId(Long reviewId)와 같은 메서드가 있다면 그것을 호출합니다.
                List<ReviewReplyDto> replies = reviewReplyDao.selectAll(review.getReviewId()); // reviewReplyDao의 selectAll 메서드 사용
                review.setReplies(replies);
                System.out.println("DEBUG: Service.getAll - Review ID " + review.getReviewId() + " has " + (replies != null ? replies.size() : "null") + " replies.");
            }
        }
        return reviews;
    }

    @Override
    public List<ReviewReplyDto> selectAll(Long reviewId) throws Exception {
        // 이 메서드는 reviewReplyDao를 통해 호출되어야 합니다. Service가 직접 SqlSessionTemplate을 사용하는 것은 좋지 않습니다.
        // ReviewReplyDao에 reviewReply.selectAllRepliesByReviewId 에 해당하는 메서드를 추가하고 그것을 호출하세요.
        // 예: return reviewReplyDao.selectAllRepliesByReviewId(reviewId);
        System.out.println("DEBUG: Service.selectAll(reviewId) called. This method should ideally be in ReviewReplyService or use ReviewReplyDao.");
        // 임시로 직접 호출한다고 가정하면:
        return session.selectList("org.spring.example.review.ReviewReplyMapper.selectAllRepliesByReviewId", reviewId);
    }

    @Override
    public List<ReviewBoardDto> getReviewsByAccId(Long accId) {
        System.out.println("DEBUG: Service.getReviewsByAccId called for accId: " + accId);
        List<ReviewBoardDto> reviews = reviewBoardDao.findByAccId(accId); // findByAccId 호출 (또는 getReviewsByAccId)
        System.out.println("DEBUG: Service.getReviewsByAccId - DAO.findByAccId returned " + (reviews != null ? reviews.size() : "null") + " reviews.");
        return reviews;
    }
}



