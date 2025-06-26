package org.spring.example.review;

import java.time.LocalDateTime;

public class ReviewReplyDto {
    private Long reviewReplyId;
    private Long reviewId;
    private Long accId;
    private int rate;
    private String comments;
    private int likeCnt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


    public Long getReviewReplyId() {
        return reviewReplyId;
    }

    public void setReviewReplyId(Long reviewReplyId) {
        this.reviewReplyId = reviewReplyId;
    }

    public Long getReviewId() {
        return reviewId;
    }

    public void setReviewId(Long reviewId) {
        this.reviewId = reviewId;
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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
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
}