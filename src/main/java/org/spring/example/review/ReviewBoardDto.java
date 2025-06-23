package org.spring.example.review;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

public class ReviewBoardDto {
private BigInteger id;
        private BigInteger userId;
        private BigInteger accId;
        private int rate;
        private String comment;
        private int likeCnt;
        private Timestamp createdAt;
        private Timestamp updatedAt;

        public ReviewBoardDto(){};
        public ReviewBoardDto( BigInteger id, BigInteger userId,
                               BigInteger accId,int rate,
                               String comment,int likeCnt,
                               Timestamp createdAt,Timestamp
                                       updatedAt){
            this.id=id;
            this.accId=accId;
            this.rate=rate;
            this.comment=comment;
            this.likeCnt=likeCnt;
            this.createdAt=createdAt;
            this.updatedAt=updatedAt;

         }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }


    public BigInteger getUserId() {
            return userId;
    }

    public void setUserId(BigInteger userId) {
            this.userId = userId;
    }

    public BigInteger getAccId() {
            return accId;
    }
    public void setAccId(BigInteger accId) {
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
     public Timestamp getCreatedAt() {
            return createdAt;
     }
     public void setCreatedAt(Timestamp createdAt) {
            this.createdAt = createdAt;
     }
     public Timestamp getUpdatedAt() {
            return updatedAt;
     }
     public void setUpdatedAt(Timestamp updatedAt) {
            this.updatedAt = updatedAt;
     }

    @Override
    public String toString() {
        return "ReviewBoardDto{" +
                "id=" + id +
                ", user_id=" + userId +
                ", acc_id=" + accId +
                ", rate=" + rate +
                ", comment='" + comment + '\'' +
                ", like_cnt=" + likeCnt +
                ", created_at=" + createdAt +
                ", updated_at=" + updatedAt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ReviewBoardDto that = (ReviewBoardDto) o;
        return Objects.equals(id, that.id) && Objects.equals(userId, that.userId) && Objects.equals(accId, that.accId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, accId);
    }

    public void setCreatedAt(Date date) {
    }
}







