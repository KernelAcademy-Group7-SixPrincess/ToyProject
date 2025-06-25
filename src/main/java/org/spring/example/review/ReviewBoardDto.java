package org.spring.example.review;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class ReviewBoardDto {
        private Long reviewId;
        private Long userId;
        private Long accId;
        private int rate;
        private String comment;
        private int likeCnt;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;
        private List<ReviewReplyDto> replies;

        public ReviewBoardDto(){};
        public ReviewBoardDto(Long reviewId, Long userId,
                              Long accId, int rate,
                              String comment, int likeCnt,
                              LocalDateTime createdAt, LocalDateTime
                                       updatedAt, List<ReviewReplyDto> replies){
            this.reviewId=reviewId;
            this.accId=accId;
            this.rate=rate;
            this.comment=comment;
            this.likeCnt=likeCnt;
            this.createdAt=createdAt;
            this.updatedAt=updatedAt;
            this.replies=replies;
        }

    public Long getReviewId() {
        return reviewId;
    }

    public void setReviewId(Long reviewId) {
        this.reviewId = reviewId;
    }


    public Long getUserId() {
            return userId;
    }

    public void setUserId(Long userId) {
            this.userId = userId;
    }

    public Long getAccId() {
            return accId;
    }
    public void setAccId(Long accId) {
            this.accId = accId;
    }

    public int getRate() {
            return rate;
    }
    public void setRate(int rate) {
            this.rate = rate;
    }

     public String getComment() {
            return comment;
     }
     public void setComment(String comment) {
            this.comment = comment;
     }
     public int getLikeCnt() {
            return likeCnt;
     }
     public void setLikeCnt(int likeCnt) {
            this.likeCnt = likeCnt;
     }
     public LocalDateTime getCreatedAt() {
            return createdAt;
     }
     public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
     }
     public LocalDateTime getUpdatedAt() {
            return updatedAt;
     }
     public void setUpdatedAt(LocalDateTime updatedAt) {
            this.updatedAt = updatedAt;
     }

    public List<ReviewReplyDto> getReplies() {
        return replies;
    }

    public void setReplies(List<ReviewReplyDto> replies) {
        this.replies = replies;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ReviewBoardDto that = (ReviewBoardDto) o;
        return Objects.equals(reviewId, that.reviewId) && Objects.equals(userId, that.userId) && Objects.equals(accId, that.accId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(reviewId, userId, accId);
    }

    public void setCreatedAt(Date date) {
    }


}

